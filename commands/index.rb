# vim: set ts=2 sw=2 et ai ft=ruby:

usage       'index'
summary     'loads the content (in output/) into the Solr search index'
aliases     :i, :solr
flag        :l, :live, "operate on a live Solr instance"
option      :o, :output, "output file for the Solr add XML document", :argument => :required
option      :u, :url, "override Solr instance URL (defaults to http://localhost:8983/solr)", :argument => :required

class SolrIndex < ::Nanoc::CLI::CommandRunner
  def run
    total_time = start_time = Time.now
    if options[:live] or options[:url]
      require 'rsolr'
    end
    require 'builder'
    require 'nokogiri'
    #require 'hpricot_scrub'
    require 'time'
    self.require_site

    self.site.compiler.load

    solr = begin
             url = if options[:url]
                     options[:url]
                   elsif options[:live]
                     conf = site.config.fetch :solr, {}
                     url = conf.fetch 'url', 'http://localhost:8983/solr/'
                   else
                     nil
                   end
             if url
               RSolr.connect :url => url
             else
               nil
             end
           end

    file_prefix = site.config.fetch 'output_dir', 'output'

    items = self.site.items.reject do |item|
      item.reps.empty? or
      item.binary? or
      item.reps.empty? or
      item.reps.first.raw_paths.empty? or
      item.reps.first.path.nil?
    end
    indexable_items = items.map do |item|
      file = File.join file_prefix, item.reps.first.path
      file << "index.html" if file.end_with? '/'
      { id: item.identifier, file: file, item: item }
    end.reject{|item| item[:item][:kind] == 'internal'}
    .select{|item| item[:file] =~ %r{\.html$}}

    xml = Builder::XmlMarkup.new
    docs = []
    begin
      xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
      xml.add do
        indexable_items.each do |i|
          start = Time.now
          begin
            item = i[:item]
            types = case item.identifier
                    when %r{^/schedule/room}
                      [:schedule, :room]
                    when %r{^/schedule/track}
                      [:schedule, :track]
                    when %r{^/schedule/speaker}
                      [:schedule, :speaker]
                    when %r{^/schedule/event}
                      [:schedule, :event]
                    when %r{^/schedule/day}
                      [:schedule, :day]
                    when %r{^/schedule/}
                      [:schedule]
                    when %r{^/news/}
                      [:news]
                    when %r{^/interviews/}
                      [:interview]
                    else
                      [:content]
                    end
            interview_year = if item.identifier =~ %r{^/interviews/(\d{4})-}
                               $1
                             else
                               nil
                             end
            #content = Nokogiri::HTML(item.raw_content).text
            raise "item #{item.identifier} has #{item.reps.size}, can't decide which one to use" unless item.reps.size == 1
            #raw_content = item.compiled_content(:snapshot => :pre)
            raw_content = item.reps.first.content[:last]
            content = Nokogiri::HTML(item.reps.first.content[:last]).text.strip
            #content = Hpricot(raw_content).scrub.to_s.strip

            doc = {
              :id => item.path,
              :title => item[:title],
              :type => types.map(&:to_s),
              :content => content,
            }

            doc[:interview_year] = interview_year if interview_year


            docs << doc

            xml.doc do
              xml.field(item.path, :name => "id")
              if item[:title]
                #xml.field(item[:title], :name => "title", :boost => "10.0")
                xml.field(item[:title], :name => "title")
              else
                $stderr.puts "HUH, no title for #{item.path} ?"
              end
              types.map(&:to_s).each do |t|
                xml.field(t, :name => 'type')
              end
              if content and not content.empty?
                xml.field(content, :name => 'content')
              end
            end
          rescue
            $stderr.puts "failed to index #{item.identifier}"
            raise
          end
        end
      end
    end

    if solr
      begin
        start = Time.now
        solr.delete_by_query '*:*'
        log :low, :delete, '*:*', Time.now - start
      end

      begin
        start = Time.now
        begin
          solr.add docs do |doc|
            doc.field_by_name(:title).attrs[:boost] = 10.0
          end
        rescue RSolr::Error::Http => e
          body = eval e.response[:body]
          raise "Solr responded with HTTP code #{e.response[:status]}: #{body['error']['msg']}"
        end
        log :low, :index, "#{docs.size} documents out of #{self.site.items.size} items", Time.now - start
      end

      [ :commit, :optimize ].each do |action|
        start = Time.now
        solr.method(action).call
        log :low, action, '', Time.now - start
      end
    end

    if options[:output]
      start = Time.now
      File.open(options[:output], "w") do |f|
        f.puts xml.target!
      end
      log :high, :write, "Solr <add/> written to #{options[:output]}", Time.now - total_time
    end

  end

  private
  ACTION_COLORS = {
    :delete   => "\e[1;31m",
    :index    => "\e[1;32m",
    :write    => "\e[1;32m",
    :commit   => "\e[1;33m",
    :optimize => "\e[1;33m",
  }
  def log(level, action, name, duration=nil)
    Nanoc::CLI::Logger.instance.log(
      level,
      '%s%12s%s  %s%s' % [
        ACTION_COLORS[action.to_sym],
        action.to_s,
        "\e[0m",
        duration.nil? ? '' : "[%2.2fs]  " % [ duration ],
        name
      ]
    )
  end
end

runner SolrIndex

