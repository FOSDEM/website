# vim: set ts=2 sw=2 et ai ft=ruby:

usage       'pentabarf'
summary     'loads the Pentabarf database and stores it as a cache file'
aliases     :p, :penta, :pc, :cache

module PentaDB
end

class PentabarfCache < ::Nanoc::CLI::CommandRunner

  def run
    total_time = start_time = Time.now

    require 'yaml'
    require 'psych'
    YAML::ENGINE.yamler = 'psych'
    require 'json'
    require 'active_record'
    require 'fileutils'

    # some helpers
    to_slug = lambda{|x| x.fetch('slug')}

    # load the configuration from the site
    require_site
    conf = site.config.fetch(:pentabarf)
    cid = conf.fetch('conference_id')
    $thumb_width, $thumb_height = begin
                                    t = conf[:thumbnail]
                                    if t
                                      [ t.fetch(:width, 32), t.fetch(:height, 32) ]
                                    else
                                      [ 32, 32 ]
                                    end
                                  end

    $image_export_root = conf.fetch 'photo_export_root', "photos"
    $attachment_export_root = conf.fetch 'attachment_export_root', "attachments"
    $meta_export_file = conf.fetch 'meta_export_file', "pentabarf.yaml"

    $export_roots = [$image_export_root, $attachment_export_root]

    begin
      h = conf.fetch('host', 'localhost')
      p = conf.fetch('port', '5432')
      puts "Connecting to Pentabarf database at #{h}:#{p} ..."
      ActiveRecord::Base.establish_connection(
        :adapter => 'postgresql',
        :username => conf.fetch('username'),
        :password => conf.fetch('password'),
        :database => conf.fetch('database'),
        :host => conf.fetch('host', 'localhost'),
        :port => conf.fetch('port', '5432'),
        :schema_search_path => conf.fetch('schema', 'public'),
      )
    end
    begin
      ActiveRecord::Base.connection
    rescue
      raise "Failed to connect to the Pentabarf database"
    end

    $export_roots.each do |d|
      FileUtils.mkdir_p(d) unless File.exists? d
    end

    # crawl the current cache directory and keep a tree of all files
    # that are in there in order to detect the files we need to delete
    # after rendering changes; don't bother about directories, as we
    # remove all empty directories at the end of the process
    $cache_tree_before = begin
                           require 'find'
                           r = []
                           $export_roots.each do |d|
                             Find.find(d) do |f|
                               r << f unless File.directory? f
                             end
                           end
                           r.sort
                         end

    # obviously, we haven't created/updated any files yet
    $cache_tree_after = []

    def yf(file, content, time_before=nil)
      require 'pathname'
      b = Pathname.new(file).dirname.to_s
      # don't bother about directories in $image_export_root_tree_after
      FileUtils.mkdir_p(b) unless File.exists? b

      action = if File.exists?(file)
                 new_digest = sha(content)
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
        File.open(file, "wb") do |f|
          f.write(content)
        end
      end

      $cache_tree_after << file

      Nanoc::CLI::Logger.instance.file(action == :identical ? :low : :high, action, file, time_before.nil? ? nil : Time.now - time_before)

      action
    end

    puts "Rendering cache..."
    start_time = Time.now

    {
      :Room             => 'conference_room',
      :ScheduleEvent    => 'view_schedule_event',
      :Event            => 'event',
      :Conference       => 'conference',
      :ConferenceDay    => 'conference_day',
      :Track            => 'conference_track',
      :Person           => 'person',
      :EventPerson      => 'event_person',
      :EventLink        => 'event_link',
      :ConferencePerson => 'conference_person',
      :ConferencePersonLink => 'conference_person_link',
      :PersonImage      => 'person_image',
      :EventRelated     => 'event_related',
      :EventAttachment  => 'event_attachment',
    }.each do |klass, table|
      c = Class.new(ActiveRecord::Base)
      c.table_name = table
      PentaDB.const_set klass.to_s, c
    end

    def slug(o, attr)
      slug = if o.has_key? 'slug' and o['slug']
               o.fetch('slug')
             else
               o[attr.to_s]
             end
      raise "slug: o[#{attr}] is nil" if o.nil?

      sanitized = begin
                    require 'active_support/inflector/transliterate'
                    require 'active_support/inflector/methods'
                    # Inflector takes care of replacing locale specific symbols to
                    # something "safe" for URLs without requiring symbol gibberish
                    ActiveSupport::Inflector.transliterate(slug).downcase.gsub(/[\s\-\+]+/, '_').gsub(/[\.']+/, '')
                  end
      sanitized
    end

    def slugify!(o, attr)
      if o.nil?
        nil
      elsif o.is_a? Array
        o.each{|x| slugify!(x, attr)}
      else
        o['slug'] = slug(o, attr)
      end
    end

    def markup(text)
      return '' if text.nil?
      text = text.to_s.strip
      return '' if text.empty?

      require 'bluecloth'
      BlueCloth.new(text, :filter_html).to_html
    end

    def model(record, attributes=nil)
      if record.nil?
        nil
      elsif record.is_a? Array
        record.map{|x| model(x, attributes)}
      elsif record.is_a? Hash
        if attributes
          h = {}
          record.each do |k,v|
            h[k.to_s] = v if attributes.include? k.to_sym
          end
          h
        else
          h = {}
          record.each do |k,v|
            h[k.to_s] = v
          end
          h
        end
      elsif record.respond_to? :attributes
        model record.attributes, attributes
      else
        raise "record #{record.inspect} of class #{record.class} doesn't have an attributes() method"
      end
    end

    def byid(ary, attr)
      r = {}
      ary.each{|i| r[i[attr.to_s]] = i}
      r
    end

    def yamldate(d)
      d.strftime('%Y-%m-%d %T.000000000 +00:00')
    end

    conference = model PentaDB::Conference.where(conference_id: cid).find(:all).first
    raise "failed to find conference object in database with conference_id=#{cid}" if conference.nil?

    days = slugify!(model(PentaDB::ConferenceDay.where(conference_id: cid, :public => true).find(:all).sort_by{|d| d['conference_day'] }, [:conference_day_id, :conference_day, :name]), :name)
    day_by_day_id = byid days, :conference_day_id

    # decorate days with a title
    days.each do |d|
      d['title'] = d['name']
    end

    events = slugify!(model(
      PentaDB::Event.where(conference_id: cid, event_state: 'accepted').where("language='en' OR language IS NULL").find(:all).select do |e|
      e.duration and e.conference_track_id and e.conference_room_id and e.conference_day_id and e.public == true and %w{confirmed reconfirmed}.include? e.event_state_progress
      end,
        [:event_id, :conference_id, :slug, :title, :subtitle, :conference_track_id, :event_type, :duration, :event_state, :event_state_progress, :language, :conference_room_id, :conference_day_id, :start_time, :abstract, :description ]
    ), :title)

    # render the event markup (abstract and description)
    events.each do |e|
      [:abstract, :description].each do |a|
        e[a.to_s] = markup(e.fetch(a.to_s))
        e["raw_#{a.to_s}"] = e.fetch(a.to_s)
      end
    end

    # decorate events with day names and start_datetime, end_datetime, duration
    events.each do |e|
      def dt(date, tobj)
        time = case tobj
               when Time
                 tobj
               when DateTime
                 tobj.to_time
               else
                 h, m, s = tobj.to_s.split(':')
                 raise "the \"#{tobj.to_s}\" (#{tobj.class}) can't be parsed as a time/duration" unless h and m and s
                 DateTime.new(1, 1, 1, h.to_i, m.to_i, s.to_i)
               end

        DateTime.new(date.year, date.month, date.day, h.to_i, m.to_i, s.to_i)
      end
      def time2date(t1, t2)
        # construct DateTime from t2 (time) with the same day as t1
        DateTime.new(t1.year, t1.month, t1.day, t2.hour, t2.minute, t2.second)
      end
      def tnt(t1, t2)
        h, m, s = t2.split(':')
        t1 + (h.to_i / 24.0) + (m.to_i / (24 * 60.0)) + (s.to_i / (24 * 60 * 60.0))
      end
      d = day_by_day_id[e['conference_day_id']]
      e['conference_day'] = d['conference_day_id']
      e['day'] = d.fetch('slug')
      e['day_name'] = d.fetch('name')
      start = dt(d['conference_day'], e['start_time'])
      e['start_datetime'] = yamldate start
      end_datetime = tnt(start, e['duration'])
      e['end_datetime'] = yamldate end_datetime
      e['start_time'] = start.strftime('%H:%M')
      e['end_time'] = end_datetime.strftime('%H:%M')
    end

    event_by_event_id = begin
                          h = {}
                          events.each{|e| h[e['event_id']] = e}
                          h
                        end

    eventpersons = PentaDB::EventPerson
    .where(event_role: ['coordinator', 'moderator', 'speaker'])
    .where(event_role_state: ['confirmed', 'offer'])
    .find(:all)
    .select{|ep| event_by_event_id.has_key? ep.event_id}
    eventpersons_by_event_id = begin
                                 h = {}
                                 eventpersons.each{|ep| h[ep['event_id']] = []}
                                 eventpersons.each{|ep| h[ep['event_id']] << ep}
                                 h
                               end
    eventpersons_by_person_id = begin
                                  h = {}
                                  eventpersons.each{|ep| h[ep['person_id']] = []}
                                  eventpersons.each{|ep| h[ep['person_id']] << ep}
                                  h
                                end

    speakers = begin
                 list = model PentaDB::Person.find(:all).reject{|p| eventpersons_by_person_id.fetch(p['person_id'], []).empty?}, [:person_id, :title, :gender, :first_name, :last_name, :public_name, :nickname]
                 # decorate speakers with a 'name'
                 list.each do |p|
                   name = if p['public_name']
                            p['public_name']
                          else
                            "#{p['first_name']} #{p['last_name']}"
                          end
                   p['name'] = name
                   p['title'] = name
                 end
                 # inject a slug
                 slugify! list, :name
                 list
               end

    speaker_by_person_id = byid speakers, :person_id

    # post-process speakers with conference_person
    begin
      # decorate speakers with conference_persons, but only with selected fiels
      # to avoid bleeding private information such as their email
      PentaDB::ConferencePerson.where(conference_id: cid).find(:all).each do |cp|
        p = speaker_by_person_id[cp.person_id]
        # if we have no match (p) then it's not a speaker, and simply skip to the next
        if p
          # copy that attribute, might be useful for investigating issues in
          # the pentabarf database
          p['conference_person_id'] = cp.conference_person_id

          # copy those attributes and convert the markup
          [:abstract, :description].each do |a|
            p[a.to_s] = markup(cp.send(a))
          end
        else
          # it's not a speaker, ignore
        end
      end
    end

    # post-process speakers with conference_person_links
    # (now that we have person.conference_person_id)
    # but fetch and cache all conference_person_link rows,
    # it's faster
    begin
      cplinks = PentaDB::ConferencePersonLink.find(:all)
      # and hash them by conference_person_id
      cplinks_by_cpid = begin
                          h = {}
                          cplinks.each{|l| h[l.conference_person_id] = []}
                          cplinks.each{|l| h[l.conference_person_id] << l}
                          h
                        end
      # now decorate the persons with their links
      speakers.each do |p|
        links = model(cplinks_by_cpid.fetch(p['conference_person_id'], []), [:url, :title, :rank]).sort_by{|l| l['rank']}
        # post-process links by setting 'title' if not set
        links.each do |l|
          l['title'] = l.fetch('url') unless l['title']
        end
        p['links'] = links
      end
    end

    # post-process events with event_link
    begin
      # fetch all event_link rows into a cache, faster
      # (don't run model() on all of them, we'll discard most as the query returns the
      # event_link rows for all conferences)
      eventlinks = PentaDB::EventLink.find(:all)
      eventlinks_by_event_id = begin
                                 h = {}
                                 eventlinks.each{|l| h[l['event_id']] = []}
                                 eventlinks.each{|l| h[l['event_id']] << l}
                                 h
                               end
      events.each do |e|
        links = model(eventlinks_by_event_id.fetch(e['event_id'], []).sort_by{|l| [l.rank, l.event_link_id]}, [:url, :title, :rank])
        # post-process the links and set 'title' if not set
        links.each do |l|
          l['title'] = l.fetch('url') unless l['title']
        end
        e['links'] = links
      end
    end

    # post-process events with event_related
    begin
      # fetch all event_related into a cache, faster
      eventrelated = PentaDB::EventRelated.find(:all).select{|r| event_by_event_id.has_key? r['event_id1']}
      h = begin
            require 'set'

            h = {}
            eventrelated.each do |r|
              [
                [ r['event_id1'], r['event_id2'] ],
                [ r['event_id2'], r['event_id1'] ],
              ].each do |a|
                h[a.first] = Set.new unless h.has_key? a.first
                h[a.first] << a.last
              end
            end
            h
          end

      h.each do |from_id, to_ids|
        from = event_by_event_id.fetch(from_id)
        from['related'] = to_ids.map{|id| event_by_event_id.fetch(id)['slug']}
      end
    end

    # tracks
    tracks = begin
               list = model(PentaDB::Track.where(conference_id: cid).find(:all).sort_by{|t| [t.rank, t.conference_track_id]}, [:conference_track_id, :conference_track, :rank])

               # XXX hack because of broken 2012 database
               list.reject!{|t| t['conference_track'] == 'Main Tracks'}

               # add 'name' and 'type'
               list.each do |t|
                 name = t['conference_track'].gsub(/\s+(track|devroom)$/i, '')
                 t['name'] = name
                 t['title'] = t['conference_track']
                 t['type'] = case t['conference_track']
                             when /\s+track$/i
                               'maintrack'
                             when /\s+devroom$/i
                               'devroom'
                             when /^lightning\s*talks?$/i
                               'lightningtalk'
                             when /^keynotes?$/i
                               'keynote'
                             when /^certifications?$/i
                               'certification'
                             end
               end
               # inject slugs
               slugify!(list, :name)
               list
             end

    track_by_track_id = byid tracks, :conference_track_id
    # decorate tracks with events
    begin
      events_by_track_id = begin
                             h = {}
                             events.each{|e| h[e['conference_track_id']] = []}
                             events.each{|e| h[e['conference_track_id']] << e}
                             h
                           end
      tracks.each do |t|
        trackevents = events_by_track_id.fetch(t['conference_track_id'], []).sort_by{|e| e['start_datetime']}
        t['events'] = trackevents.map(&to_slug)
        t['events_by_day'] = begin
                               h = {}
                               days.each{|d| h[d.fetch('slug')] = trackevents.select{|e| e['conference_day_id'] == d['conference_day_id']}.map(&to_slug)}
                               h
                             end

      end
    end
    # decorate events with track information
    begin
      events.each do |e|
        t = track_by_track_id[e['conference_track_id']]
        if t
          e['track'] = t.fetch('slug')
          e['track_name'] = t.fetch('name')
          e['track_full_name'] = t['conference_track']
          e['track_rank'] = t['rank']
          e['type'] = t['type']
        end
      end
    end

    # rooms
    rooms = slugify!(model(PentaDB::Room.where(conference_id: cid, :public => true).find(:all).sort_by{|r| [r.rank, r.conference_room_id]}, [:conference_room_id, :conference_room, :size, :rank]), :conference_room)
    room_by_room_id = byid rooms, :conference_room_id

    # decorate rooms with a title
    rooms.each do |r|
      r['title'] = r['conference_room']
    end

    # decorate rooms with events
    begin
      events_by_room_id = begin
                            h = {}
                            events.each{|e| h[e['conference_room_id']] = []}
                            events.each{|e| h[e['conference_room_id']] << e}
                            h
                          end
      rooms.each do |r|
        roomevents = events_by_room_id.fetch(r['conference_room_id'], []).sort_by{|e| e['start_datetime']}
        r['events'] = roomevents.map(&to_slug)
        # also set the events by day
        r['events_by_day'] = begin
                               h = {}
                               days.each{|d| h[d.fetch('slug')] = roomevents.select{|e| e['conference_day_id'] == d['conference_day_id']}.map(&to_slug)}
                               h
                             end
      end
    end

    # add room to events
    begin
      events.each do |e|
        room = room_by_room_id.fetch(e.fetch('conference_room_id'))
        e['room'] = room['slug']
        e['room_name'] = room['conference_room']
        e['room_rank'] = room['rank']
      end
    end

    # add rooms to tracks
    tracks.each do |t|
      trackevents = events_by_track_id.fetch(t['conference_track_id'], []).sort_by{|e| e['start_datetime']}
      trackrooms = trackevents.map{|e| e['conference_room_id']}.uniq.map{|id| room_by_room_id[id]}.sort_by{|r| [r['rank'], r['conference_room_id']]}
      t['rooms'] = trackrooms.map(&to_slug)

      t['events_per_room_per_day'] = begin
                                       by_day_hash = {}
                                       days.each{|d| by_day_hash[d.fetch('slug')] = {}}
                                       trackevents.group_by{|e| e['conference_day_id']}.each do |day_id, track_events_per_day|
                                         day_name = day_by_day_id.fetch(day_id).fetch('slug')
                                         track_events_per_day.group_by{|e| e['conference_room_id']}.each do |room_id, track_events_per_room|
                                           room_slug = room_by_room_id.fetch(room_id).fetch('slug')
                                           by_room_hash = by_day_hash.fetch(day_name)
                                           by_room_hash[room_slug] = [] unless by_room_hash.has_key? room_slug
                                           track_events_per_room.each{|e| by_room_hash[room_slug] << e.fetch('slug')}
                                         end
                                       end
                                       by_day_hash
                                     end
    end

    # cross-post-process events and speakers
    begin
      events.each do |e|
        event_speakers = eventpersons_by_event_id.fetch(e['event_id'], []).map{|ep| speaker_by_person_id[ep['person_id']]}.reject{|s| s.nil?}.sort_by{|p| p['person_id']}.uniq{|p| p['person_id']}

        e['speakers'] = event_speakers.map(&to_slug)
      end
      speakers.each do |s|
        speaker_events = eventpersons_by_person_id.fetch(s['person_id'], []).map{|ep| event_by_event_id[ep['event_id']]}.reject{|e| e.nil?}.sort_by{|e| e['event_id']}.uniq{|e| e['event_id']}
        s['events'] = speaker_events.map(&to_slug)
        s['events_by_day'] = begin
                               h = {}
                               days.each{|d| h[d.fetch('slug')] = speaker_events.select{|e| e['conference_day_id'] == d['conference_day_id']}.map(&to_slug)}
                               h
                             end
      end
    end

    # compute start_time and end_time for various schedule items
    begin
      events_per_day = begin
                         h = {}
                         days.each do |d|
                           cdi = d.fetch('conference_day_id')
                           h[d.fetch('slug')] = events.select{|e| e.fetch('conference_day_id') == cdi}
                         end
                         h
                       end

      days.each do |d|
        earliest = events_per_day.fetch(d['slug']).sort_by{|e| e.fetch 'start_time'}.first
        latest   = events_per_day.fetch(d['slug']).sort_by{|e| e.fetch 'end_time'}.last
        d['start_time'] = earliest.fetch('start_time') if earliest
        d['end_time'] = latest.fetch('end_time') if latest
      end
    
      {
        conference_track_id: tracks,
        conference_room_id:  rooms,
      }.each do |a, list|
        k = a.to_s
        raise "nil list? (#{a})" if list.nil?
        raise "empty list? (#{a})" if list.empty?
        list.each do |item|
          kv = item.fetch(k)
          ['start_time', 'end_time'].each{|x| item[x] = {}}
          days.each do |d|
            matching_events = events_per_day.fetch(d['slug']).select{|e| e.fetch(k) == kv}
            earliest = matching_events.sort_by{|e| e.fetch 'start_time'}.first
            latest   = matching_events.sort_by{|e| e.fetch 'end_time'  }.last
            item['start_time'][d['slug']] = earliest ? earliest.fetch('start_time') : nil
            item['end_time'  ][d['slug']] = latest   ?   latest.fetch('end_time')   : nil
          end
        end
      end
    end

    # compute start_time_index and end_time_index where applicable
    begin
      # compute time slot interval in minutes from timeslot_duration on the conference object
      tsim = begin
               require 'time'
               td = conference['timeslot_duration']
               t = Time.parse(td)
               raise "conference :timeslot_duration has seconds" unless t.sec == 0
               raise "conference :timeslot_duration is less than 5 minutes" unless t.min >= 5
               t.min + t.hour * 60
             end

      [
        events,
        days,
      ].each do |list|
        list.each do |item|
          [ 'start_time', 'end_time' ].each do |a|
            time = item.fetch(a)
            h, m = time.split(':').map(&:to_i)[0,2]
            raise "time with granularity != 5 min: #{time} for item #{item.inspect}" if m % tsim != 0
            index = (h * 60 + m) / tsim

            item[a + '_index'] = index
          end
        end
      end

      # same here, except that the start_time, end_time attributes are
      # hashes (key = day slug)
      [ tracks, rooms].each do |list|
        list.each do |item|
          [ 'start_time', 'end_time' ].each do |a|
            item[a + '_index'] = {}
            item.fetch(a).each do |dayslug, time|
              unless time.nil?
                h, m = time.split(':').map(&:to_i)[0,2]
                raise "time with granularity != 5 min: #{time} for item #{item.inspect}" if m % tsim != 0
                index = (h * 60 + m) / tsim
                item[a + '_index'][dayslug] = index
              else
                item[a + '_index'][dayslug] = nil
              end
            end
          end
        end
      end

    end

    # event attachments
    before_attachments = Time.now
    events.each do |event|
      # add an attachments array to each event, even if it turns out empty
      event['attachments'] = []

      PentaDB::EventAttachment.where(:public => true, event_id: event['event_id']).find(:all).each do |a|
        time_before = Time.now
        f = a.filename.gsub(/[\s\-]+/, '_').gsub(%r{/+}, '')
        filename = File.join(
          'event',
          event['slug'],
          a.attachment_type,
          a.event_attachment_id.to_s,
          f
        )
        file = File.join($attachment_export_root, filename)
        action = yf(file, a.data, time_before)

        meta = { 'filename' => filename, }
        meta['mime'] = a['mime_type'] if a['mime_type']
        meta['title'] = a['title'] if a['title']
        meta['pages'] = a['pages'].to_i if a['pages']
        meta['size'] = File.size(file)

        event['attachments'] << meta
      end #a
    end #events
    after_attachments = Time.now
    start_time += (after_attachments - before_attachments)

    # add photos to speakers
    before_photos = Time.now
    speakers.each do |speaker|
      PentaDB::PersonImage.where(:public => true, person_id: speaker['person_id']).find(:all).each do |i|
        time_before = Time.now
        if i.image.size > 0
          extension = case i.mime_type
                      when 'image/png'
                        'png'
                      when 'image/gif'
                        'gif'
                      when 'image/jpeg'
                        'jpg'
                      else
                        raise "unsupported image MIME type \"#{i.mime_type}\" for person #{person.person_id}"
                      end

          require 'RMagick'
          require 'base64'

          image = begin
                    Magick::Image::from_blob(i.image).first
                  rescue Exception => e
                    puts "WARNING: failed to read photo for person #{speaker['person_id']}: #{e.message}"
                    nil
                  end

          unless image.nil?
            image_filename = File.join($image_export_root, 'photo', speaker['slug'] + "." + extension)
            action = yf(image_filename, i.image, time_before)
            time_before = Time.now

            speaker['photo'] = {
              'slug' => "#{speaker['slug']}.#{extension}",
              'mime' => i.mime_type,
              'width' => image.columns,
              'height' => image.rows,
            }

            thumb_filename = File.join($image_export_root, 'thumbnail', speaker['slug'] + "." + extension)

            tw, th = if action == :identical and File.exists? thumb_filename
                       content = IO.read(thumb_filename)
                       t = Magick::Image::from_blob(content).first
                       $cache_tree_after << thumb_filename
                       [t.columns, t.rows]
                     else
                       t = image.resize_to_fill($thumb_width, $thumb_height)
                       yf(thumb_filename, t.to_blob, time_before)
                       [t.columns, t.rows]
                     end

            speaker['thumbnail'] = {
              'slug' => "#{speaker['slug']}.#{extension}",
              'mime' => i.mime_type,
              'width' => tw,
              'height' => th,
            }
          end #image.nil?
        end #if
      end #each i
    end #each speaker
    after_photos = Time.now
    start_time += (after_photos - before_photos)

    def byslug(ary)
      h = {}
      ary.each do |item|
        h[item.fetch('slug')] = item
      end
      h
    end

    tree = {
      'conference' => conference,
      'days' => byslug(days),
      'rooms' => byslug(rooms),
      'tracks' => byslug(tracks),
      'events' => byslug(events),
      'speakers' => byslug(speakers),
    }

    yf($meta_export_file, tree.to_yaml, start_time)

    # now let's compute which files and dirs we need to remove
    # because they were there before but have not been touched
    # while rendering the cache this time
    begin
      outdated = begin
                   r = []
                   h = {}
                   $cache_tree_after.each{|x| h[x] = 1}
                   $cache_tree_before.each do |f|
                     r << f unless h[f]
                   end
                   r.sort
                 end

      require 'fileutils'
      outdated.each do |f|
        if File.directory? f
          dirs << f
        else
          FileUtils.rm f
          Nanoc::CLI::Logger.instance.file(:high, :delete, f)
        end
      end
    end

    # now crawl for empty directories and remove those too
    begin
      # let's pack this routine into a function of its own,
      # as we need to reiterate the process (see below)
      def find_empty_dirs(dir)
        list = []
        require 'find'
        Find.find(dir) do |d|
          next unless File.directory? d

          # see http://stackoverflow.com/questions/5059156/check-if-directory-is-empty-in-ruby
          if (Dir.entries(d) - %w{ . .. }).empty?
            list << d
          end
        end
        list
      end

      # we have to iterate until we can't find any empty directories any more,
      # as removing one empty directory can yield other empty directories as
      # empty too
      empty_dirs = find_empty_dirs($image_export_root)
      until empty_dirs.empty?
        empty_dirs.each do |d|
          FileUtils.rmdir d
          Nanoc::CLI::Logger.instance.file(:high, :delete, d)
        end
        empty_dirs = find_empty_dirs($image_export_root)
      end
    end

    puts
    puts "Pentabarf cache built in #{format('%.2f', Time.now - total_time)}s."

  end

  private
  def sha(content)
    require 'digest/sha2'
    sha = Digest::SHA256.new
    sha << content
    sha.hexdigest.downcase
  end

end

runner PentabarfCache

