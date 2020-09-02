# vim: set ts=2 sw=2 et ai ft=ruby:

usage       'index'
summary     'loads the content (in output/) into the Solr search index'
description 'Default behaviour (when neither --local nor --output is specified) is
to load the index into Solr through ssh'
aliases     :i, :solr
flag        :l, :local, "operate on a local Solr instance"
option      :o, :output, "output file for the Solr add XML document", :argument => :required
option      :u, :url, "override Solr instance URL (defaults to http://localhost:8983/solr/staging/)", :argument => :required
option      :e, :environment, "specify the Solr coar to load data into (defaults to staging)", :argument => :required

class SolrIndex < ::Nanoc::CLI::CommandRunner
  def run
    total_time = start_time = Time.now
    if options[:local] or options[:url]
      require 'rsolr'
    end
    require 'builder'
    require 'nokogiri'
    require 'time'
    self.require_site

    self.site.compiler.load

    core = if options[:environment]
             options[:environment]
           else
             'staging'
           end

    solr = begin
             url = if options[:url]
                     options[:url]
                   elsif options[:local]
                     conf = site.config.fetch :solr, {}
                     url = conf.fetch 'url', 'http://localhost:8983/solr/' + core + '/'
                   else
                     nil
                   end
             if url
               solr = RSolr.connect :url => url
               solr.head('admin/ping').response[:status] == 200 or raise "failed to ping Solr at #{solr.url.to_s}"
               solr
             else
               nil
             end
           end

    file_prefix = site.config.fetch 'output_dir', 'output'

    indexable_items = self.site.items.reject do |item|
      item.binary? or
        item[:index] == false or
        item[:alias_of] or
        item[:kind] == 'internal' or
        item[:filename] =~ /\.(css|png|gif|jpg|jpeg|xml|ical|xcal)$/ or
        item.path.nil? or
        item.path =~ /\.(css|png|gif|jpg|jpeg|xml|ical|xcal)$/ or
        item.reps.empty? or
        item.reps.first.raw_paths.empty? or
        item.reps.first.path.nil?
    end
                          .map do |item|
      file = File.join file_prefix, item.reps.first.path
      file << "index.html" if file.end_with? '/'
      { id: item.identifier, file: file, item: item }
    end

    xml = Builder::XmlMarkup.new
    docs = []
    begin
      xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8"
      xml.add do
        indexable_items.each do |i|
          start = Time.now
          begin
            item = i[:item]
            types = case item.identifier
                    when %r{^/schedule/([^/]+)/}
                      [:schedule, $1.to_sym]
                    when %r{^/schedule/}
                      [:schedule]
                    when %r{^/news/}
                      [:news]
                    when %r{^/interviews/}
                      [:interview]
                    when %r{^/call_}
                      [:cfp]
                    else
                      [:content]
                    end
            interview_year = if item.identifier =~ %r{^/interviews/(\d{4})-}
                               $1
                             else
                               nil
                             end
            raise "item #{item.identifier} has #{item.reps.size}, can't decide which one to use" unless item.reps.size == 1

            #raw_content = item.reps.first.content[:last]
            #raw_content = item.compiled_content

            raw_content = begin
                            f = File.join(file_prefix, item.path)
                            if File.directory? f
                              f = File.join(f, 'index.html')
                            end
                            IO.read(f)
                          end
            html = Nokogiri::HTML(raw_content)
            main = html.css('#main')
            content = main.text.strip

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
                xml.field(item[:title], :name => "title", :boost => "10.0")
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
        log :high, :index, "#{docs.size}/#{self.site.items.size} items in #{solr.uri.to_s}", Time.now - start
      end

      [:commit, :optimize].each do |action|
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

    unless solr or options[:output]
      start = Time.now
      require 'open3'
      message = []

      user = site.config.fetch(:search).fetch(:user)
      host = site.config.fetch(:search).fetch(:host)
      command = site.config.fetch(:search).fetch(:command)

      Open3.popen2e('ssh', user + '@' + host, command + ' ' + core) do |i, oe, t|
        i.puts xml.target!
        i.close
        oe.each { |line| message << line }
        fail "failed to run ssh to " + user + "@" + host + ": #{message.join($/)}#{$/}#{$/}Please contact server@fosdem.org" unless t.value.success?
      end
      message = message.join($/)
      if message =~ %r{^(\d+) documents in index ([a-z].*)}
        log :high, :index, "#{$1}/#{self.site.items.size} items in Solr on " + host + " for core #{$2}", Time.now - start
      end
    end
  end

  private

  ACTION_COLORS = {
    :delete => "\e[1;31m",
    :index => "\e[1;32m",
    :write => "\e[1;32m",
    :commit => "\e[1;33m",
    :optimize => "\e[1;33m",
  }
  def log(level, action, name, duration = nil)
    Nanoc::CLI::Logger.instance.log(
      level,
      '%s%12s%s  %s%s' % [
        ACTION_COLORS[action.to_sym],
        action.to_s,
        "\e[0m",
        duration.nil? ? '' : "[%2.2fs]  " % [duration],
        name
      ]
    )
  end
end

runner SolrIndex

