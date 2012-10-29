#!/usr/bin/env ruby
# encoding: UTF-8
#vim: set ts=2 sw=2 et ai:
require 'sinatra'
require 'sinatra/reloader' if development?
require 'rsolr'

$solr_url = "http://127.0.0.1:8983/solr"
$display_rating = false
$results_per_page = 15
$type_label = {
  speaker: 'success',
  event: 'important',
  track: 'info',
  interview: 'inverse',
}

template :results do
  <<-EOF
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
<p class="search-result-count">Found <%= @num_results %> matches for your query:</p>
<%
  end
%>
<ul class="search-results">
<% @results.each_with_index do |r, i| %>
  <li style="padding-bottom: 1em;" class="<%= i % 2 == 0 ? 'even' : 'odd' %>">
    <% if $display_rating %><span class="shiny-stars"><%= "\u{2605}" * r[:rating] %></span><span class="dead-stars"><%= "\u{2606}" * (5 - r[:rating]) %></span>&nbsp;<% end %>
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
<div class="pagination-positioner" style="position: relative; bottom: -6em;">
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
</div>
<% end %>
EOF
end

template :error do
  <<-EOF
<div class="alert alert-block">
  <h4>Oops!</h4>
  Something went booboo with the search.
</div>
<% if @error %>
<pre><%= @error %></pre>
<% end %>
EOF
end

$facets_template = <<-EOF
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
EOF

set(:has_parameter) do |parameter|
  condition do
    params.has_key? parameter.to_s and not params[parameter.to_s].strip.empty?
  end
end

puts ARGV[0]
exit 99

set :views, File.join(settings.root, '../../output/searcher')

$solr ||= begin
            puts "Connecting to Solr on #{$solr_url}"
            RSolr.connect :url => $solr_url
          rescue
            $stderr.puts "failed to connect to Solr on #{$solr_url}"
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

get '*', :has_parameter => :q do
  puts uri()
  search
end

get '/search/:q' do
  search
end

get '/search/:q/:page' do
  search
end

get '/search', :has_parameter => :q do
  search
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

def search(q=nil, page=nil)
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
    :qf => 'title^10',
    :rows => $results_per_page,
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
  solr_params[:start] = (page - 1) * $results_per_page if page

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
             t = doc['type'].map{|t| t.to_sym}
             if t.include? :speaker
               :speaker
             elsif t.include? :event
               :event
             elsif t.include? :track
               :track
             elsif t.include? :interview
               title.sub! /^interview\s*:\s*/i, ''
               :interview
             else
               nil
             end
           end

    { title: title, href: doc['id'], kind: kind, rating: rating, text: text, types: doc['type'], interview_year: doc['interview_year']}
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

    if found > $results_per_page
      @pagination = true
      pages = ((found / ($results_per_page * 1.0)) + 0.9).to_i
      # normalize the value of page to avoid users injecting ridiculous values:
      page = pages if page > pages
      page = 1 if page < 1

      @page_link = begin
                     require 'uri'
                     uri = "#{@base_uri}/?q=#{URI.escape q}"
                     types.each do |type|
                       uri << "&#{URI.escape type}"
                     end
                     uri
                   end

      @pages = pages
      @current_page = page
      @prev_page = page > 1 ? page - 1 : nil
      @next_page = page < pages ? page + 1 : nil

      @head = begin
                # http://googlewebmastercentral.blogspot.be/2011/09/pagination-with-relnext-and-relprev.html
                l = []
                l << %Q{<link rel="canonical" href="#{@abs_uri}?page=#{@current_page}"/>}
                l << %Q{<link rel="prev" href="#{@abs_uri}?page=#{@prev_page}"/>} if @prev_page
                l << %Q{<link rel="next" href="#{@abs_uri}?page=#{@next_page}"/>} if @next_page
                l.join("\n")
              end

    else
      @pagination = false
    end

    @title = "Search results for #{q}"
    @search_navigation = erb $facets_template, :layout => false
    erb :results
  end
end

