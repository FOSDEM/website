# vim: set ts=2 sw=2 et ai ft=ruby:

usage       'pentasync'
aliases     :penta, :ps, :p
summary     'syncs the pentabarf schedule with the local files'

require 'psych'
YAML::ENGINE.yamler = 'psych'
require 'erubis'

module ::PentaHelpers
  def PentaHelpers.name(o)
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
    when Person
      if o.first_name.nil? or o.last_name.nil? and not o.public_name.nil?
        o.public_name
      else
        "#{o.first_name} #{o.last_name}"
      end
    else
      raise "unsupported class for name(): #{o.class.to_s}"
    end
  end

  def PentaHelpers.idattr(o)
    case o
    when Room
      :conference_room_id
    when ScheduleEvent
      :event_id
    when Track
      :conference_track_id
    when Day
      :conference_day_id
    when Person
      :person_id
    else
      raise "unsupported class for idattr(): #{o.class.to_s}"
    end
  end

  def PentaHelpers.slug(o)
    require 'active_support/inflector/transliterate'
    require 'active_support/inflector/methods'
    s = if o.respond_to? :slug
          o.slug
        else
          name(o)
        end
    ActiveSupport::Inflector.transliterate(s).downcase.gsub(/\s+/, '_').gsub(/\-/, '_')
  end

  def PentaHelpers.ltype(o)
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
    when Person
      "person"
    else
      raise "unsupported class for ltype(): #{o.class.to_s}"
    end
  end

  def PentaHelpers.l(obj)
    if obj.is_a? Array
      obj.map{|x| l(x)}.join(", ")
    else
      "<a href=\"#{ltype(obj)}:#{slug(obj)}\">#{name(obj)}</a>"
    end
  end

  def PentaHelpers.id(obj)
    a = idattr(obj)
    obj.send(a)
  end

  # Pentabarf uses BlueCloth to convert its text markup in
  # description and abstract into HTML
  def PentaHelpers.markup(text)
    require 'bluecloth'
    BlueCloth.new( text.to_s, :filter_html ).to_html
  end

end

# needed to also use helper functions in templates
class Context < Erubis::Context
  def markup(text)
    PentaHelpers::markup(text)
  end
  def idattr(o)
    PentaHelpers::idattr(o)
  end
  def slug(o)
    PentaHelpers::slug(o)
  end
  def name(o)
    PentaHelpers::name(o)
  end
  def ltype(o)
    PentaHelpers::ltype(o)
  end
  def l(o)
    PentaHelpers::l(o)
  end
  def id(o)
    PentaHelpers::id(o)
  end
end

class Pentabarf < ::Nanoc::CLI::CommandRunner

  require 'ostruct'

  private
  def sha(content)
    require 'digest/sha2'
    sha = Digest::SHA256.new
    sha << content
    sha.hexdigest.downcase
  end

  def render_to(template, target, *bindings)
    time_before = Time.now
    require 'pathname'
    require 'fileutils'

    vars = {}
    bindings.each do |x|
      if x.kind_of? Hash
        x.each{|k,v| vars[k] = v}
      elsif x.kind_of? Array and x.empty?
        # that's fine
      else
        raise "unsupported render flag \"#{x}\""
      end
    end
    t = Erubis::Eruby.new(File.read("layouts/schedule/#{template}.html"))

    context = Context.new(vars)
    output = t.evaluate(context)
    file = File.join("content", "schedule", "#{target}.html")
    d = Pathname.new(file).dirname.to_s
    FileUtils.mkdir_p(d) unless File.exists?(d)

    action = if File.exists?(file)
               new_digest = sha(output)
               old_digest = sha(IO.read(file))
               if new_digest != old_digest
                 :update
               else
                 :identical
               end
             else
               :create
             end

    unless action == :identical
      File.open(file, "w+") do |f|
        f.write(output)
      end
      duration = Time.now - time_before
      Nanoc::CLI::Logger.instance.file(:high, action, file, duration)
    else
      duration = Time.now - time_before
      Nanoc::CLI::Logger.instance.file(:low, :identical, file, duration)
    end
  end

  private
  def render(template, *bindings)
    render_to(template, template, bindings)
  end

  public
  def run
    start_time = Time.now

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
      :Person           => 'persons',
      :EventPerson      => 'event_persons',
      :ConferencePerson => 'c_persons',
    }.each do |klass, table|
      f = Class.new(OpenStruct) do
      end
      Kernel.const_set klass.to_s, f
      YAML::add_domain_type("pentabarf,0", table) do |type, val|
        f.new(val)
      end
    end

    FileUtils.mkdir_p 'content/schedule'

    begin
      puts "Loading Pentabarf cache..."
      time_before = Time.now
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
      $persons = yl(Person, 'persons')
      $event_persons = yl(EventPerson, 'event_persons')
      $conference_persons = yl(ConferencePerson, 'c_persons')
      duration = Time.now - time_before
      Nanoc::CLI::Logger.instance.log(:high, "%s%12s%s  [%2.2fs]  %s" % [ "\e[1m", "cache", "\e[0m", duration, "loaded from #{$cache}" ])
    end

    begin
      time_before = Time.now
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
      $person_by_id = byid($persons, :person_id)
      $conference_person_by_person_id = byid($conference_persons, :person_id)

      $room_events = earr($rooms, :conference_room_id)
      $track_events = earr($tracks, :conference_track_id)
      $events.select{|e| e.conference_room_id }.each do |e|
        raise "event #{e.event_id} for room #{e.conference_room_id} that doesn't exist" unless $room_events[e.conference_room_id]
        $room_events[e.conference_room_id] << e
        raise "event #{e.event_id} for track #{e.conference_track_id} that doesn't exist" unless $track_events[e.conference_track_id]
        $track_events[e.conference_track_id] << e
      end

      $event_persons_by_event_id = earr($event_persons, :event_id)
      $event_persons.each{|ep| $event_persons_by_event_id[ep.event_id] << ep}

      speaker_roles = ['coordinator', 'moderator', 'speaker']
      speaker_states = ['confirmed', 'offer']
      $speaker_persons = {}
      $speaker_conference_persons = {}
      $speaker_person_by_id = {}
      $speaker_for = earr($persons, :person_id)

      $events.each do |e|
        $speaker_persons[e.event_id] = []
        $speaker_conference_persons[e.event_id] = []

        $event_persons_by_event_id.fetch(e.event_id, []).select{|ep| speaker_roles.include? ep.event_role and speaker_states.include? ep.event_role_state }.each do |ep|
          person = $person_by_id.fetch(ep.person_id)
          confperson = $conference_person_by_person_id[ep.person_id]
          $speaker_persons[ep.event_id] << person
          $speaker_conference_persons[ep.event_id] << confperson unless confperson.nil?
          $speaker_person_by_id[person.person_id] = person
          $speaker_for[person.person_id] << e
        end
      end

      duration = Time.now - time_before
      Nanoc::CLI::Logger.instance.log(:high, "%s%12s%s  [%2.2fs]  %s" % [ "\e[1m", "cache", "\e[0m", duration, "postprocessed" ])
    end

    begin
      puts "Compiling schedule pages..."
      time_before = Time.now

      # and here we do the actual rendering
      # simply render all the templates that end in 's'
      Dir.glob(File.join('layouts', 'schedule', '*s.html')).reject{|f| File.directory? f}.each do |template|
        render(Pathname.new(template).basename.to_s.gsub(/\..+$/, ''))
      end

      # render the speakers
      $speaker_person_by_id.values.each do |person|
        confperson = $conference_person_by_person_id[person.person_id]
        events = $speaker_for[person.person_id]
        render_to('speaker', File.join('speaker', PentaHelpers::slug(person)), :p => person, :cp => confperson, :events => events)
      end

      duration = Time.now - time_before
      Nanoc::CLI::Logger.instance.log(:high, "%s%12s%s  [%2.2fs]  %s" % [ "\e[1m", "schedule", "\e[0m", duration, "rendered" ])
    end

    puts
    puts "Schedule compiled in #{format('%.2f', Time.now - start_time)}s."
  end

end

runner Pentabarf

