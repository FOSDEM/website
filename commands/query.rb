# vim: set ts=2 sw=2 et ai ft=ruby:

usage       'query [query]'
summary     'queries Solr'
aliases     :q
flag        :f, :facets,    'do a faceted search'

class SolrQuery < ::Nanoc::CLI::CommandRunner
  def run
    raise Nanoc::Errors::GenericTrivial, "usage: #{command.usage}" if arguments.size != 1

    require 'rsolr'
    self.require_site
    solr = begin
             conf = site.config.fetch :solr, {}
             url = conf.fetch 'url', 'http://search.int.fosdem.org:8983/solr/production/'
             RSolr.connect :url => url
           end

    params = begin
               p = {
                 :wt => :ruby,
                 :q => arguments[0],
                 :fl => '*,score',
                 :hl => 'true',
                 'hl.fl' => 'title',
                 'hl.simple.pre' => '<HL>',
                 'hl.simple.post' => '</HL>',
                 'hl.requireFieldMatch' => 'false',
                 'hl.usePhraseHighlighter' => 'false',
               }
               if options[:facets]
                 p[:facet] = 'true'
                 p['facet.field'] = 'type'
               end
               p
             end

    response = solr.get 'select', :params => p
    puts "\e[32;1mFound #{response['response']['numFound']} result(s)\e[0m"
    puts
    max_score = response['response']['maxScore'].to_f

    if response.has_key? 'facet_counts'
      puts "\e[36;1;4mFacets:\e[0m"
      Hash[*(response['facet_counts']['facet_fields']['type'])]
      .reject{|facet, count| count < 1}
      .sort_by{|facet, count| count}
      .reverse
      .each do |facet, count|
        puts "\e[30;1m*\e[0m #{facet} (#{count})"
      end
      puts
    end
    hl = response.fetch 'highlighting', {}
    begin
      puts "\e[36;1;4mResults:\e[0m"
      response['response']['docs'].each do |doc|
        stars = begin
                  rating = (((doc['score'].to_f / max_score) * 100) + 0.5).to_i / 20
                  "\e[33;1m" + ("\u{2605}" * rating) + "\e[0;37m" + ("\u{2606}" * (5 - rating)) + "\e[0m"
                end
        puts "#{stars} \e[35;4;1m#{doc['id']}\e[0m"
        title = begin
                  h = hl[doc['id']]
                  if h
                    t = h['title']
                    unless t.nil? or t.empty?
                      t.first.gsub('<HL>', "\e[43;30;1m").gsub('</HL>', "\e[0m")
                    else
                      doc['title']
                    end
                  else
                    doc['title']
                  end
                end

        puts "      #{title}"
        puts "      \e[32m#{doc['type'].join(', ')}\e[0m" if doc['type']
        puts
      end
    end
  end
end

runner SolrQuery
