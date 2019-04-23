#!/usr/bin/env ruby
# encoding: UTF-8
#vim: set ts=2 sw=2 et ai:
require 'sinatra'
require 'sinatra/reloader' if development?
require 'rsolr'

$type_label = {
  speaker: 'success',
  event: 'important',
  track: 'info',
  interview: 'inverse',
}

enable :inline_templates

set(:has_parameter) do |parameter|
  condition do
    params.has_key? parameter.to_s and not params[parameter.to_s].strip.empty?
  end
end

#set :views, File.join(settings.root, '../../output/searcher')

$solr ||= begin
            puts "Connecting to Solr on #{settings.solr_url}"
            RSolr.connect :url => settings.solr_url
          rescue
            $stderr.puts "failed to connect to Solr on #{settings.solr_url}"
            raise
          end

$known_types ||= begin
                    response = $solr.get 'select', :params => {
                      :wt => :ruby,
                      :q => '*:*',
                      :fl => 'id',
                      :facet => 'true',
                      'facet.field' => 'type',
                      :rows => 1,
                    }
                    if response.has_key? 'facet_counts'
                      Hash[*(response['facet_counts']['facet_fields']['type'])]
                      .map{|f,c| f}
                    else
                      []
                    end
                  rescue
                    nil
                  end

get '*', :has_parameter => :q, :provides => 'html' do
  search :html
end

get '*', :has_parameter => :q, :provides => 'atom' do
  search :atom, false
end

error do
  @error = if env and env.has_key? 'sinatra_error' and env['sinatra_error']
             env['sinatra_error'].message
           else
             nil
           end
  @title = "Something went wrong"
  erb :error
end

def search(template=:html, layout=:layout)
  q = params[:q] unless q
  page = params[:page] unless page

  page = begin
           s = page
           s ? s.to_i : 1
         rescue
           1
         end

  solr_params = {
    :q => q,
    :qf => 'title^50 text',
    :rows => settings.results_per_page,
    :fl => '*,score',
    :hl => 'true',
    'hl.fl' => ['title', 'content'],
    'hl.simple.pre' => '[[[HL]]]',
    'hl.simple.post' => '[[[/HL]]]',
    'hl.requireFieldMatch' => 'false',
    'hl.usePhraseHighlighter' => 'true',
    :facet => 'true',
    'facet.field' => ['{!ex=dt}type', '{!ex=dt}interview_year'],
    'facet.missing' => 'false',
    :wt => :ruby,
  }

  fq = []

  types = params.keys.select{|name| ($known_types or []).include? name}
  fq << "{!tag=dt}type:" + types.join(" OR ") unless types.empty?

  interview_years = begin
                      l = []
                      params.select{|name, value| name == 'interview_year' }.each do |name, value|
                        if value.is_a? Array
                          l.push *value
                        else
                          l << value
                        end
                      end
                      l.select{|year| year =~ /^\d{4}$/}
                    end
  fq << "{!tag=dt}interview_year:" + interview_years.join(" OR ") unless interview_years.empty?

  types << 'interview' unless interview_years.empty? or types.include? 'interview'

  solr_params[:fq] = fq
  solr_params[:start] = (page - 1) * settings.results_per_page if page

  @error = nil
  raise "Solr is not running" unless $solr

  response = $solr.get 'select', :params => solr_params

  r = response.fetch('response', {})
  found = r.fetch('numFound', 0)
  max_score = r.fetch('maxScore', 0)

  @facets = if response.has_key? 'facet_counts'
              Hash[*(response['facet_counts']['facet_fields']['type'])]
              .sort_by{|facet, count| count}
              .reject{|facet, count| count < 1}
              .reject{|facet, count| facet == 'content' or facet == 'schedule'}
              .reverse
            else
              {}
            end

  @interview_year_facets = if response.has_key? 'facet_counts'
                             Hash[*(response['facet_counts']['facet_fields']['interview_year'])]
                             .sort_by{|facet, count| count}
                             .reject{|facet, count| count < 1}
                             .reverse
                           else
                             {}
                           end

  hl = response.fetch 'highlighting', {}

  @results = r.fetch('docs', []).map do |doc|
    rating = (((doc['score'].to_f / max_score) * 100) + 0.5).to_i / 20
    h = hl[doc['id']]
    title = if h and h['title'] and not h['title'].empty?
              h['title'].join(" ... ")
            else
              doc['title']
            end
    content = if h and h['content'] and not h['content'].empty?
                "\u{2026}" + h['content'].join(" \u{2026} ") + "\u{2026}"
              else
                # doc['content']
                # don't show anything regarding the content if there is no search match
                nil
              end

    text = begin
             t = content ? content.strip : nil
             if t.nil? or t.empty?
               nil
             else
               t
             end
           end

    def sanitize(text)
      if text
        require 'nokogiri'
        Nokogiri::HTML(text).text.strip.gsub('[[[HL]]]', '<em>').gsub('[[[/HL]]]', '</em>')
      else
        nil
      end
    end

    text = sanitize text
    title = sanitize title

    kind = begin
             ty = doc['type'].map{|t| t.to_sym}
             if ty.include? :speaker
               :speaker
             elsif ty.include? :event
               :event
             elsif ty.include? :track
               :track
             elsif ty.include? :interview
               title.sub! /^interview\s*:\s*/i, ''
               :interview
             else
               nil
             end
           end

    {
      title: title,
      title_nohl: doc['title'],
      href: doc['id'],
      kind: kind,
      rating: rating,
      text: text,
      text_nohl: doc['content'],
      types: doc['type'],
      interview_year: doc['interview_year'],
    }
  end

  @q = q
  @types = types
  @interview_years = interview_years
  @num_results = found

  @refine = true
  @head = ''

  begin
    @base_uri = request.path_info.to_s
    @abs_uri = uri()

    if found > settings.results_per_page
      @pagination = true
      pages = ((found / (settings.results_per_page * 1.0)) + 0.9).to_i
      # normalize the value of page to avoid users injecting ridiculous values:
      page = pages if page > pages
      page = 1 if page < 1

      partial = begin
                  require 'uri'
                  #uri = "#{@base_uri}"
                  #uri << '/' unless uri.end_with? '/'
                  uri = "?q=#{URI.escape q}"
                  uri << "&" << types.map{|type| URI.escape type}.join('&') unless types.empty?
                  uri
                end

      @page_link = @base_uri + partial

      @pages = pages
      @current_page = page
      @prev_page = page > 1 ? page - 1 : nil
      @next_page = page < pages ? page + 1 : nil
      @last_page = pages

      @head = begin
                abs_page_uri = @abs_uri + partial
                # http://googlewebmastercentral.blogspot.be/2011/09/pagination-with-relnext-and-relprev.html
                l = []
                l << %Q{<link rel="canonical" href="#{abs_page_uri}&page=#{@current_page}"/>}
                l << %Q{<link rel="prev" href="#{abs_page_uri}&page=#{@prev_page}"/>} if @prev_page
                l << %Q{<link rel="next" href="#{abs_page_uri}&page=#{@next_page}"/>} if @next_page
                l.join("\n")
              end

    else
      @pagination = false
    end

    @title = "Search results for #{CGI::escapeHTML(q)}"
    @search_navigation = erb :facets, :layout => false
    erb template, :layout => layout
  end
end

__END__

@@ atom
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom"
      xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/">
  <title>FOSDEM Search: <%= @q %></title>
  <link href="<%= @page_link %>"/>
  <opensearch:totalResults><%= @num_results %></opensearch:totalResults>
  <opensearch:startIndex><%= @current_page %></opensearch:startIndex>
  <opensearch:itemsPerPage><%= settings.results_per_page %></opensearch:itemsPerPage>
  <opensearch:Query role="request" searchTerms="<%= @q %> startPage="<%= @current_page %>"/>
  <link rel="alternate" href="<%= @page_link %>page=<%= @current_page %>" type="text/html"/>
  <link rel="self" href="<%= @page_link %>page=<%= @current_page %>" type="application/atom+xml"/>
  <link rel="first" href="<%= @page_link %>page=1" type="application/atom+xml"/>
  <% if @prev_page %>
  <link rel="previous" href="<%= @prev_page %>" type="application/atom+xml"/>
  <% end %>
  <% if @next_page %>
  <link rel="next" href="<%= @next_page %>" type="application/atom+xml"/>
  <% end %>
  <link rel="last" href="<%= @page_link %>page=<%= @last_page %>" type="application/atom+xml"/>
  <% @results.each do |r| %>
  <entry>
    <title><%= r[:title_nohl] %></title>
    <link href="<%= r[:href] %>"/>
    <% if r[:text_nohl] %>
    <content type="text"><%= r[:text_nohl] %></content>
    <% end %>
  </entry>
  <% end %>
</feed>

@@ html
<%
  case @num_results
  when 0
%>
<p class="no-search-results">Found no content that matches the query.</p>
<%
  when 1
%>
<p class="search-result-count">Found one piece of content that matches the query:</p>
<%
  else
%>
<p class="search-result-count">Found <%= @num_results %> matches for your query, with up to <%= settings.results_per_page %> results per page:</p>
<%
  end
%>
<ul class="search-results">
<% @results.each_with_index do |r, i| %>
  <li style="padding-bottom: 1em;" class="<%= i % 2 == 0 ? 'even' : 'odd' %>">
    <a href="<%= r[:href] %>"><% if r[:kind] %><span class="search-result-kind"><%= r[:kind].to_s.capitalize %>:</span> <% end %><%= r[:title] %></a>
    <% unless r[:types].reject{|t| t == 'schedule'}.empty? %>
    <span class="pull-right">
    <% r[:types].reject{|t| t == 'schedule'}.each do |t| %>
    <span class="label label-<%= $type_label.fetch(t.to_sym, 'unknown') %>"><%= t %></span>
    <% end %>
    <% if r[:interview_year] %>
    <span class="label"><%= r[:interview_year] %></span>
    <% end %>
    </span>
    <% end %>
    <% if r[:text] %><p><small><%= r[:text] %></small></p><% end %>
  </li>
<% end %>
</ul> <!-- search-results -->

<% if @pagination %>
<div class="pagination pagination-centered">
  <ul>
    <% if @prev_page %>
    <li><a href="<%= @page_link %>&page=<%= @prev_page %>" rel="prev">Prev</a></li>
    <% else %>
    <li class="disabled"><a>Prev</a></li>
    <% end %>
    <% (1..@pages).each do |p| %>
    <li<% if p == @current_page %> class="active" rel="canonical"<% end %>><a href="<%= @page_link %>&page=<%= p %>"><%= p %></a></li>
    <% end %>
    <% if @next_page %>
    <li><a href="<%= @page_link %>&page=<%= @next_page %>" rel="next">Next</a></li>
    <% else %>
    <li class="disabled"><a>Next</a></li>
    <% end %>
  </ul>
</div>
<% end %>

@@ error
<div class="alert alert-block">
  <h4>Oops!</h4>
  Something went booboo with the search.
</div>
<% if @error %>
<pre><%= @error %></pre>
<% end %>

@@ facets
<form id="refine-search" class="nav nav-list" action="<%= @base_uri %>" method="get">
  <div class="input-prepend">
    <span class="add-on"><i class="icon-search"></i></span>
    <input type="text" id="q" name="q" class="span10 input-medium" value="<%= @q %>" />
  </div>
  <% (@facets or {}).each do |facet, count| %>
    <label class="checkbox"><%= facet.capitalize %> (<%= count %>)
      <input type="checkbox" name="<%= facet %>" value=""<% if @types.include? facet %> checked="checked"<% end %> onclick="this.form.submit();"/>
    </label>
  <% end %>
  <% (@interview_year_facets or {}).each do |value, count| %>
    <label class="checkbox"><%= value %> (<%= count %>)
      <input type="checkbox" name="interview_year[]" value="<%= value %>"<% if @interview_years.include? value %> checked="checked"<% end %> onclick="this.form.submit();"/>
    </label>
  <% end %>
  <button type="submit" class="btn btn-small"><i class="icon-repeat"></i> Refine search</button>
</form>
<li class="divider"></li>

