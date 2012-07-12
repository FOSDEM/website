# vim: set ts=2 sw=2 et ai ft=ruby:

usage       'pentacache'
summary     'loads the Pentabarf database and stores it as a cache file'
aliases     :pc

module PentaDB
end

class PentabarfCache < ::Nanoc::CLI::CommandRunner

  def run
    require 'psych'
    YAML::ENGINE.yamler = 'psych'
    require 'active_record'
    require 'fileutils'

    require_site
    conf = site.config.fetch(:pentabarf)
    $cache = conf['cache'] || 'tmp/pentacache'
    $cid = conf.fetch('conference_id')

    ActiveRecord::Base.establish_connection(
      :adapter => 'postgresql',
      :username => conf.fetch('username'),
      :password => conf.fetch('password'),
      :database => conf.fetch('database'),
      :host => conf.fetch('host', 'localhost'),
      :port => conf.fetch('port', '5432'),
      :schema_search_path => conf.fetch('schema', 'public'),
    )
    begin
      ActiveRecord::Base.connection
    rescue
      raise "Failed to connect to the Pentabarf database"
    end

    FileUtils.rm_rf($cache) if File.exists?($cache)

    def yc(file, v)
      require 'pathname'
      fqf = File.join($cache, file)
      b = Pathname.new(fqf).dirname
      FileUtils.mkdir_p(b) unless File.exists?(b)

      File.open(fqf, "wb") do |f|
        f.write(v.attributes.to_yaml)
      end
    end

    {
      :Room             => [ 'conference_room',     'rooms',    :conference_room_id,    :cid,       ],
      :ScheduleEvent    => [ 'view_schedule_event', 'events',   :event_id,              :cid, :tr,  ],
      :Conference       => [ 'conference',          'conf',     nil,                    :cid,       ],
      :ConferenceDay    => [ 'conference_day',      'days',     :conference_day_id,     :cid,       ],
      :Track            => [ 'conference_track',    'tracks',   :conference_track_id,   :cid,       ],
    }.each do |klass, info|
      table = info[0]
      render_dir = info[1]
      render_pk = info[2]
      render_flags = info[3..-1]

      c = Class.new(ActiveRecord::Base) do
        yaml_as "!pentabarf,0/#{table}"
        def self.yamlname=(v)
          @@yamlname = v
        end
        def to_yaml_type
          "!pentabarf,0/#{@@yamlname}"
        end
      end
      c.table_name = table
      c.yamlname = table
      PentaDB.const_set klass.to_s, c

      q = c.scoped
      q = q.scoped.where(:conference_id => $cid) if render_flags.include? :cid
      q = q.scoped.where(:translated => 'en') if render_flags.include? :tr
      if render_pk
        q.find(:all).each do |r|
          yc(File.join(render_dir, r.send(render_pk).to_s), r)
        end
      else
        yc(render_dir, q.find(:first))
      end

    end

  end
end

runner PentabarfCache

