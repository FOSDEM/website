# vim: set ts=2 sw=2 et ai ft=ruby:

usage       'pentasync'
aliases     :penta, :ps, :p
summary     'syncs the pentabarf schedule with the local files'

require 'psych'
YAML::ENGINE.yamler = 'psych'
require 'erubis'

# needed to also use helper functions in templates
class Context < Erubis::Context
  def idattr(o)
    case o
    when Room
      :conference_room_id
    when ScheduleEvent
      :event_id
    when Track
      :conference_track_id
    when Day
      :conference_day_id
    else
      raise "unsupported class for idattr(): #{o.class.to_s}"
    end
  end

  def slug(o)
    require 'active_support/inflector/transliterate'
    require 'active_support/inflector/methods'
    s = if o.respond_to? :slug
          o.slug
        else
          name(o)
        end
    ActiveSupport::Inflector.transliterate(s).downcase.gsub(/\s+/, '_')
  end
  
  def name(o)
    case o
    when Room
      o.conference_room
    when Event
      o.title
    when ScheduleEvent
      o.title
    when Track
      o.conference_track
    when ConferenceDay
      o.name
    else
      raise "unsupported class for name(): #{o.class.to_s}"
    end
  end

  def ltype(o)
    case o
    when Room
      "room"
    when Event
      "event"
    when ScheduleEvent
      "event"
    when Track
      "track"
    when ConferenceDay
      "day"
    else
      raise "unsupported class for ltype(): #{o.class.to_s}"
    end
  end

  def l(obj)
    "<a href=\"#{ltype(obj)}:#{slug(obj)}\">#{name(obj)}</a>"
  end

  def id(obj)
    a = idattr(obj)
    obj.send(a)
  end
end

class Pentabarf < ::Nanoc::CLI::CommandRunner

  require 'ostruct'

  private
  def render_to(template, target, *bindings)
    vars = {}
    bindings.each do |a|
      a.each do |x|
        if x.kind_of? Hash
          x.each{|k,v| vars[k] = v}
        elsif x.kind_of? Array
          vars[template] = x
        else
          raise "unsupported render flag \"#{x}\""
        end
      end
    end
    t = Erubis::Eruby.new(File.read("layouts/schedule/#{template}.html"))
    context = Context.new(vars)
    output = t.evaluate(context)
    File.open("content/schedule/#{target}.html", "w+") do |f|
      f.write(output)
    end
    puts "wrote content/schedule/#{target}.html"
  end

  private
  def render(template, *bindings)
    render_to(template, template, bindings)
  end

  public
  def run
    require_site
    begin
      config = site.config.fetch(:pentabarf)
      $cache = config['cache'] || 'tmp/pentacache'
      $cid = config.fetch(:conference_id)
    end

    # define the database model classes for ActiveRecord
    {
      :Room             => 'conference_room',
      :Event            => 'event',
      :ScheduleEvent    => 'view_schedule_event',
      :Conference       => 'conference',
      :ConferenceDay    => 'conference_day',
      :Track            => 'conference_track',
    }.each do |klass, table|
      f = Class.new(OpenStruct) do
      end
      Kernel.const_set klass.to_s, f
      YAML::add_domain_type("pentabarf,0", table) do |type, val|
        f.new(val)
      end
    end

    FileUtils.mkdir_p 'content/schedule'

    puts "loading cache #{$cache}"
    def yl1(klass, file)
      obj = YAML::load_file(file)
      klass.new(obj)
    end
    def yl(klass, dir)
      ld = File.join($cache, dir)
      Dir.entries(ld).reject{|f| File.directory? f}.map{|f| File.join(ld, f)}.map{|f| yl1(klass, f)}
    end

    $conf = yl1(Conference, File.join($cache, 'conf'))
    $days = yl(ConferenceDay, 'days')
    $events = yl(ScheduleEvent, 'events')
    $rooms = yl(Room, 'rooms')
    $tracks = yl(Track, 'tracks')

    def byid(list, attr)
      result = {}
      list.each {|item| result[item.send(attr)] = item}
      result
    end
    def earr(list, attr)
      result = {}
      list.each {|item| result[item.send(attr)] = []}
      result
    end

    $room_by_id = byid($rooms, :conference_room_id)
    $event_by_id = byid($events, :event_id)
    $track_by_id = byid($tracks, :conference_track_id)

    $room_events = earr($rooms, :conference_room_id)
    $track_events = earr($tracks, :conference_track_id)
    $events.select{|e| e.conference_room_id }.each do |e|
      raise "event #{e.event_id} for room #{e.conference_room_id} that doesn't exist" unless $room_events[e.conference_room_id]
      $room_events[e.conference_room_id] << e
      raise "event #{e.event_id} for track #{e.conference_track_id} that doesn't exist" unless $track_events[e.conference_track_id]
      $track_events[e.conference_track_id] << e
    end

    # and here we do the actual rendering
    # simply render all the templates
    Dir.glob(File.join('layouts', 'schedule', '*.html')).reject{|f| File.directory? f}.each do |template|
      render(Pathname.new(template).basename.to_s.gsub(/\..+$/, ''))
    end
  end

end

runner Pentabarf

