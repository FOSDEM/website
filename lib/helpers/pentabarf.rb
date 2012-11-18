# vim: set ts=2 sw=2 et ai ft=ruby:

module Fosdem
  module Pentabarf
    def self.update(config)
      total_time = start_time = Time.now

      $meta_extension = 'yaml'
      $hash_extension = 'hash'

      # load the configuration from the site
      conf = config.fetch :pentabarf
      $thumb_width, $thumb_height = begin
                                      t = conf.fetch :thumbnail
                                      [ t.fetch(:width), t.fetch(:height) ]
                                    end

      $photo_width, $photo_height = begin
                                      t = conf.fetch :photo
                                      [ t.fetch(:width), t.fetch(:height) ]
                                    end

      $logo_width, $logo_height = begin
                                    t = conf.fetch :eventlogo
                                    [ t.fetch(:width), t.fetch(:height) ]
                                  end


      $photo_export_root, $thumbnail_export_root, $attachment_export_root, $eventlogos_export_root =
        begin
          t = conf.fetch :export_roots
          a = [ :photos, :thumbnails, :attachments, :eventlogos ].map{|f| t.fetch(f)}
          $export_roots = a
          a
        end

      $meta_export_file = conf.fetch :meta_export_file

      gateway, port = begin
                        s = conf.fetch :tunnel
                        tunnel_enabled = s.fetch :enabled
                        if s and tunnel_enabled
                          require 'net/ssh'
                          require 'net/ssh/gateway'

                          h = s.fetch :remote_host
                          p = s.fetch :remote_port
                          lp = conf.fetch :port

                          sc = Net::SSH::Config.for h
                          h = sc ? sc.fetch(:host_name, h) : nil
                          u = sc ? sc[:user] : nil

                          unless sc and u
                            if sc
                              $stderr.puts <<EOF
FATAL ERROR: failed to find "User" in the SSH configuration entry for the host #{h}
EOF
                            else
                              $stderr.puts <<EOF
FATAL ERROR: failed to find an SSH configuration entry for the host #{h}
EOF
                            end
                            $stderr.puts <<EOF

In order for nanoc to establish the ssh tunnel to the Pentabarf database
on #{h}:#{p}, it needs to know which remote user name to use.
That information is expected to be found in one of the following files:
                            #{Net::SSH::Config.default_files.join($\)}

Example:

Host #{h}
  HostName penta.fosdem.org
  User=MY_USERNAME_ON_#{h.upcase}
  ForwardX11=no
  ConnectTimeout=30
  ConnectionAttempts=5
  ServerAliveInterval=60

EOF
                            raise "missing configuration information for SSH tunneling"
                          end

                          time_before = Time.now
                          gateway = Net::SSH::Gateway.new(h, u)
                          port = gateway.open('127.0.0.1', p, lp)
                          log(:high, "connected SSH tunnel #{u}@#{h} :#{lp} -> :#{p}", Time.now - time_before)
                          [ gateway, port ]
                        else
                          [ nil, nil ]
                        end
                      end

      begin
        run_internal(conf, total_time)
      ensure
        if gateway and port
          log(:high, "disconnected SSH tunnel")
          gateway.close(port)
        end
      end

    end

    private
    def self.run_internal(conf, total_time)
      require 'yaml'
      require 'psych'
      YAML::ENGINE.yamler = 'psych'
      require 'json'
      require 'time'
      require 'active_record'
      require 'fileutils'

      connection = begin
                     time_before = Time.now

                     h = conf.fetch :host
                     p = conf.fetch :port
                     begin
                       d = conf.fetch :database
                       u = conf.fetch :username
                       pw = conf.fetch :password, ''
                       s = conf.fetch :schema
                       log(:high, "connecting to Pentabarf database //#{h}:#{p}/#{d} with user #{u}")

                       ActiveRecord::Base.establish_connection(
                         :adapter => 'postgresql',
                         :username => u,
                         :password => pw,
                         :database => d,
                         :host => h,
                         :port => p,
                         :schema_search_path => s,
                       )
                       connection = ActiveRecord::Base.connection
                       log(:high, "connected to Pentabarf database #{h}:#{p}", Time.now - time_before)
                       connection
                     rescue => e
                       raise "Failed to connect to the Pentabarf database //#{h}:#{p}/#{d} with user #{u}: #{e.message}"
                     end
                   end

      {
        Room:                 'conference_room',
        ScheduleEvent:        'view_schedule_event',
        Event:                'event',
        Conference:           'conference',
        ConferenceDay:        'conference_day',
        Track:                'conference_track',
        Person:               'person',
        EventPerson:          'event_person',
        EventLink:            'event_link',
        ConferencePerson:     'conference_person',
        ConferencePersonLink: 'conference_person_link',
        PersonImage:          'person_image',
        EventRelated:         'event_related',
        EventAttachment:      'event_attachment',
        EventImage:           'event_image',
      }.each do |klass, table|
        c = Class.new(ActiveRecord::Base)
        c.table_name = table
        Fosdem::Pentabarf.const_set klass.to_s, c
      end

      cid = begin
              t = conf.fetch :conference_id
              if t.to_s =~ /^\d+$/
                t
              else
                Conference.where(acronym: t).select('conference_id').first['conference_id'].to_i
              end
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

      # some helpers
      to_slug = lambda{|x| x.fetch('slug')}

      def self.yf(file, content, time_before=nil)
        require 'pathname'
        b = Pathname.new(file).dirname.to_s
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

      def self.slug(o, attr)
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
                      ActiveSupport::Inflector
                      .transliterate(slug)
                      .downcase
                      .gsub(/[\s\-\+]+/, '_')
                      .gsub(/[\.']+/, '')
                    end
        sanitized
      end

      def self.slugify!(o, attr)
        if o.nil?
          nil
        elsif o.is_a? Array
          o.each{|x| slugify!(x, attr)}
        else
          o['slug'] = slug(o, attr)
        end
      end

      def self.markup(text)
        return '' if text.nil?
        text = text.to_s.strip
        return '' if text.empty?

        require 'bluecloth'
        BlueCloth.new(text, :filter_html).to_html
      end

      def self.model(record, attributes=nil)
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

      def self.byid(ary, attr)
        r = {}
        ary.each{|i| r[i[attr.to_s]] = i}
        r
      end

      def self.yamldate(d)
        d.strftime('%Y-%m-%d %T.000000000 +00:00')
      end

      log(:high, "rendering cache")
      start_time = Time.now

      conference = model Conference.where(conference_id: cid).find(:all).first
      raise "failed to find conference object in database with conference_id=#{cid}" if conference.nil?
      event_time_offset = begin
                            dc = conference['day_change']
                            if dc
                              dc.hour * 3600 + dc.min * 60 + dc.sec
                            else
                              0
                            end
                          end

      days = slugify!(model(ConferenceDay.where(conference_id: cid, :public => true).find(:all).sort_by{|d| d['conference_day'] }, [:conference_day_id, :conference_day, :name]), :name)
      day_by_day_id = byid days, :conference_day_id

      # decorate days with a title
      days.each do |d|
        d['title'] = d['name']
      end

      events = begin
                 time_before = Time.now
                 events = slugify!(model(
                   Event
                   .where(conference_id: cid, event_state: 'accepted')
                   .where("(event_state_progress='confirmed' OR event_state_progress='reconfirmed')")
                   .where("language='en' OR language IS NULL")
                   .order(:event_id)
                   .find(:all)
                   .select do |e|
                     e.duration and e.conference_track_id and e.conference_room_id and e.conference_day_id and e.public == true and %w{confirmed reconfirmed}.include? e.event_state_progress
                   end,
                     [:event_id, :conference_id, :slug, :title, :subtitle, :conference_track_id, :event_type, :duration, :event_state, :event_state_progress, :language, :conference_room_id, :conference_day_id, :start_time, :abstract, :description ]
                 ), :title)

                 if event_time_offset > 0
                   # post-process event start times
                   events.each do |e|
                     if e['start_time']
                       e['start_time'] = (Time.parse(e['start_time']) + event_time_offset).strftime('%H:%M:%S')
                     end
                   end
                 end

                 log(:high, "loaded #{events.size} events", Time.now - time_before)

                 events
               end

      # validate events
      begin
        errors = {}
        begin
          events.each do |event|
            err = []
            err << "missing slug" unless event.has_key? 'slug'
            err << "accepted event without start_time" unless event.has_key? 'start_time'
            err << "accepted event without duration" unless event.has_key? 'duration'
            if event['start_time']
              t = Time.parse(event['start_time'])
              err << "event starts before 09:00: #{event['start_time']}" if t.hour < 9
              err << "event starts after 19:00: #{event['start_time']}" if t.hour >= 19
            else
              err << "event has no start_time"
            end
            errors[%Q!event #{event['event_id']} ("#{event['title']}")!] = err unless err.empty?
          end
        end

        unless errors.empty?
          msg = errors.map do |w, errlist|
            errlist.map{|e| "#{w}: #{e}"}.join($/)
          end.join($/)
          fail "Invalid events in database:#{$/}#{msg}"
        end
      end

      events.each do |e|
        # render the event markup (abstract and description)
        [:abstract, :description].each do |a|
          e[a.to_s] = markup(e.fetch(a.to_s))
          e["raw_#{a.to_s}"] = e.fetch(a.to_s)
        end

        # add an empty attachments hash to each
        e['attachments'] = []
      end

      # decorate events with day names and start_datetime, end_datetime, duration
      events.each do |e|
        dt = lambda do |date, tobj|
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

        tnt = lambda do |t1, t2|
          h, m, s = t2.split(':')
          t1 + (h.to_i / 24.0) + (m.to_i / (24 * 60.0)) + (s.to_i / (24 * 60 * 60.0))
        end

        d = day_by_day_id[e['conference_day_id']]
        e['conference_day'] = d['conference_day_id']
        e['day'] = d.fetch('slug')
        e['day_name'] = d.fetch('name')
        start = dt.call(d['conference_day'], e['start_time'])
        e['start_datetime'] = yamldate start
        end_datetime = tnt.call(start, e['duration'])
        e['end_datetime'] = yamldate end_datetime
        e['start_time'] = start.strftime('%H:%M')
        e['end_time'] = end_datetime.strftime('%H:%M')
      end

      event_by_event_id = begin
                            h = {}
                            events.each{|e| h[e['event_id']] = e}
                            h
                          end

      eventpersons = begin
                       time_before = Time.now

                       eventpersons = EventPerson
                       .where(event_role: ['coordinator', 'moderator', 'speaker'])
                       .where(event_role_state: ['confirmed', 'offer'])
                       .find(:all)
                       .select{|ep| event_by_event_id.has_key? ep.event_id}

                       log(:high, "loaded #{eventpersons.size} eventpersons", Time.now - time_before)
                       eventpersons
                     end
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
                   time_before = Time.now

                   list = model Person.find(:all).reject{|p| eventpersons_by_person_id.fetch(p['person_id'], []).empty?}, [:person_id, :title, :gender, :first_name, :last_name, :public_name, :nickname]
                   # decorate speakers with a 'name'
                   list.each do |p|
                     name = if p['public_name']
                              p['public_name']
                            elsif p['first_name'] and p['last_name']
                              "#{p['first_name']} #{p['last_name']}"
                            elsif p['nickname']
                              p['nickname']
                            else
                              %w(first_name last_name).map{|x| p[x]}.reject(&:nil?).join(' ')
                            end
                     p['name'] = name
                     p['title'] = name
                   end
                   # inject a slug
                   slugify! list, :name

                   log(:high, "loaded #{list.size} speakers", Time.now - time_before)
                   list
                 end

      speaker_by_person_id = byid speakers, :person_id

      # post-process speakers with conference_person
      begin
        # decorate speakers with conference_persons, but only with selected fields
        # to avoid bleeding private information such as their email
        ConferencePerson.find(:all, order: "conference_id DESC").each do |cp|
          p = speaker_by_person_id[cp.person_id]
          # if we have no match (p) then it's not a speaker, and simply skip to the next
          if p
            # copy that attribute, might be useful for investigating issues in
            # the pentabarf database
            p['conference_person_id'] = cp.conference_person_id

            unless p.has_key? :abstract or p.has_key? :description
              # copy those attributes and convert the markup
              [:abstract, :description].each do |a|
                p[a.to_s] = markup(cp.send(a))
              end
              if cp['conference_id'] != cid
                # mark as data from a previous conference
                p[:abstract_old] = true
                p[:description_old] = true
              end
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
        cplinks = ConferencePersonLink.find(:all)
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
        time_before = Time.now

        # fetch all event_link rows into a cache, faster
        # (don't run model() on all of them, we'll discard most as the query returns the
        # event_link rows for all conferences)
        eventlinks = EventLink.find(:all)
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

        log(:high, "loaded #{eventlinks.size} event links", Time.now - time_before)
      end

      # post-process events with event_related
      begin
        time_before = Time.now

        # fetch all event_related into a cache, faster
        eventrelated = EventRelated.order(:event_id1, :event_id2).find(:all).select{|r| event_by_event_id.has_key? r['event_id1']}
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

        log(:high, "loaded #{eventrelated.size} event relations", Time.now - time_before)
      end

      # tracks
      tracks = begin
                 time_before = Time.now

                 list = model(Track.where(conference_id: cid).find(:all).sort_by{|t| [t.rank, t.conference_track_id]}, [:conference_track_id, :conference_track, :rank])

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

                 log(:high, "loaded #{list.size} tracks", Time.now - time_before)
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
      rooms = begin
                time_before = Time.now
                rooms = slugify!(model(Room.where(conference_id: cid, :public => true).find(:all).sort_by{|r| [r.rank, r.conference_room_id]}, [:conference_room_id, :conference_room, :size, :rank]), :conference_room)
                log(:high, "loaded #{rooms.size} rooms", Time.now - time_before)
                rooms
              end

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
          #raise "empty list? (#{a})" if list.empty?
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
              time = item[a]
              # if the attribute isn't there, it just means there are no scheduled
              # events for that day yet
              if time
                h, m = time.split(':').map(&:to_i)[0,2]
                fail"time with granularity != 5 min: #{time} for item #{item.inspect}" if m % tsim != 0
                index = (h * 60 + m) / tsim

                item[a + '_index'] = index
              end
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
      begin
        log(:high, 'processing attachments')

        t = Time.now
        to_export = []
        # *MUCH* faster to load them all rather then querying them one by one
        # (load all = 2.19s, one by one = 12.35s)
        counter = 0
        EventAttachment
        .where(:public => true)
        .order('event_attachment_id')
        .select('event_attachment_id, mime_type, title, pages, event_id, attachment_type, filename, md5(data) AS data_hash')
        .each do |a|
          counter += 1

          event = event_by_event_id[a.event_id]
          next unless event

          # attachment filename sanitization
          d, f, b, ext = sanitize_filename a.filename
          fail "b=#{b}" if b =~ /\./
          mf = "#{b}.#{$meta_extension}"

          filename, meta_filename = [f, mf]
          .map{|x| File.join([d, event['slug'], a.attachment_type, a.event_attachment_id.to_s, x].reject(&:nil?))}
          file, meta_file = [filename, meta_filename].map{|x| "#{$attachment_export_root}/#{x}".gsub(%r{/+}, '/')}

          type = a['attachment_type'] or 'attachment' 

          meta = {
            'file' => file,
            'filename' => f,
            'type' => type,
            'event_id' => event['event_id'],
            'event_slug' => event['slug'],
            'id' => a.event_attachment_id,
            'identifier' => "/schedule/event/#{event['slug']}/attachments/#{type}/#{a.event_attachment_id}/#{b}/",
          }
          meta['mime'] = a['mime_type'] if a['mime_type']
          meta['title'] = a['title'] if a['title']
          meta['pages'] = a['pages'].to_i if a['pages']

          $cache_tree_after << meta_file if File.exists? meta_file

          needs_export = 
            if all_exist(file, meta_file)
              digest = md5_file(file)
              if a.data_hash.downcase == digest.downcase
                # file exists and is the same
                #Nanoc::CLI::Logger.instance.file(:low, :identical, file, 0)
                meta['size'] = File.size(file)
                $cache_tree_after << file
                false
              else
                # attachment file exists, but the content differs
                true
              end
            else
              # attachment file does not exist
              true
            end

          if needs_export
            to_export << {
              file: file,
              event_attachment_id: a.event_attachment_id,
              event_id: event['event_id'],
              meta: meta,
              meta_file: meta_file
            }
          end

          event['attachments'] << meta
        end
        log(:high, "loaded #{counter} attachment hashes, #{to_export.size} need to be exported", Time.now - t)

        log(:high, "exporting #{to_export.size} modified or missing attachments")
        t = Time.now
        to_export.each do |todo|
          tt = Time.now
          a = EventAttachment.where(event_attachment_id: todo[:event_attachment_id]).first!
          yf(todo[:file], a.data, tt)
          File.open(todo[:meta_file], "wb") do |f|
            f.write(todo[:meta].to_yaml)
          end
          $cache_tree_after << todo[:file]
          $cache_tree_after << todo[:meta_file]
        end
        log(:high, "exported #{to_export.size} modified or missing attachments", Time.now - t)

        # decorate all events with the attachment sizes
        events.each do |event|
          event['attachments'].each do |a|
            unless a['size']
              a['size'] = File.size(a.fetch('file'))
            end
          end
        end
      end
      after_attachments = Time.now
      start_time += (after_attachments - before_attachments)

      # add logos to events
      before_logos = Time.now
      begin
        counter = 0
        log(:high, 'processing event logos')
        to_export = []
        t = Time.now
        EventImage
        .order(:event_id)
        .select('event_id, mime_type, md5(image) AS image_hash, octet_length(image) AS image_length')
        .each do |i|
          counter += 1
          next if i.image_length.to_i < 1
          event = event_by_event_id[i.event_id]
          next unless event

          extension = mime_to_extension(i.mime_type)
          n = event['slug']
          filename, meta_filename, hash_filename = [extension, $meta_extension, $hash_extension].map{|x| "#{n}.#{x}"}
          file, meta_file, hash_file = [filename, meta_filename, hash_filename].map{|x| File.join($eventlogos_export_root, x)}

          id = "/schedule/event/#{event['slug']}/logo/"
          meta = {
            'file' => file,
            'filename' => filename,
            'event_id' => event['event_id'],
            'event_slug' => event['slug'],
            'identifier' => id,
            'mime' => i.mime_type,
          }

          event['logo'] = {
            'identifier' => id,
            'mime' => i.mime_type,
          }

          file_hash =
            if all_exist(file, meta_file, hash_file)
              IO.read(hash_file)
            else
              nil
            end

          needs_export =
            if file_hash
              i.image_hash.downcase != file_hash
            else
              true
            end

          if needs_export
            to_export << {
              file: file,
              event_id: i.event_id,
              slug: event['slug'],
              meta_file: meta_file,
              meta: meta,
              hash_file: hash_file,
              hash: i.image_hash.downcase
            }
          else
            $cache_tree_after << file << meta_file << hash_file
          end
        end
        log(:high, "loaded #{counter} event logo hashes, #{to_export.size} need to be exported", Time.now - t)

        before_export = Time.now
        to_export.each do |todo|
          t = Time.now
          i = EventImage.where(event_id: todo[:event_id]).first!
          image = nil
          begin
            require 'RMagick'
            image = Magick::Image.from_blob(i.image).first
            blob, width, height = if image.rows > $logo_width or image.columns > $logo_height
                                    [ image.resize_to_fill($logo_width, $logo_height).to_blob, $logo_width, $logo_height ]
                                  else
                                    [ i.image, image.columns, image.rows]
                                  end

            yf(todo[:file], blob, t)

            File.open(todo[:hash_file], 'wb') do |f|
              f.write(todo[:hash])
            end
            $cache_tree_after << todo[:hash_file]

            meta = todo[:meta].clone
            meta[:height] = height
            meta[:width] = width
            File.open(todo[:meta_file], 'wb') do |f|
              f.write(meta.to_yaml)
            end
            $cache_tree_after << todo[:meta_file]
          ensure
            image.destroy! if image
          end
        end
        log(:high, "exported #{to_export.size} event logos", Time.now - before_export)
      end
      after_logos = Time.now
      start_time += (after_logos - before_logos)

      # add photos to speakers
      before_photos = Time.now
      begin
        counter = 0
        log(:high, 'processing photos')
        t = Time.now
        to_export = []
        PersonImage
        .where(:public => true)
        .order(:person_id)
        .select('person_id, mime_type, md5(image) AS image_hash, octet_length(image) AS image_length')
        .each do |i|
          counter += 1
          next if i.image_length.to_i < 1
          speaker = speaker_by_person_id[i.person_id]
          next unless speaker

          extension = mime_to_extension(i.mime_type)
          n = speaker['slug']
          filename, thumb_filename, meta_filename, thumb_meta_filename, hash_filename =
            [extension, extension, $meta_extension, $meta_extension, $hash_extension].map{|x| "#{n}.#{x}"}

          file, meta_file, hash_file = [filename, meta_filename, hash_filename].map{|x| File.join($photo_export_root, x)}
          thumb_file, thumb_meta_file = [thumb_filename, thumb_meta_filename].map{|x| File.join($thumbnail_export_root, x)}

          id, thumb_id = ['photo', 'thumbnail'].map{|x| "/schedule/speaker/#{speaker['slug']}/#{x}/"}
          meta, thumb_meta = [id, thumb_id].map do |x|
            {
              'identifier' => x,
              'file' => file,
              'filename' => filename,
              'person_id' => speaker['person_id'],
              'speaker_slug' => speaker['slug'],
              'mime' => i.mime_type,
            }
          end

          {photo: meta, thumbnail: thumb_meta}.each do |k,m|
            speaker[k.to_s] = {
              'mime' => i.mime_type,
              'identifier' => m.fetch('identifier'),
            }
          end

          file_hash =
            if all_exist(file, hash_file, thumb_file, meta_file, thumb_meta_file)
              IO.read(hash_file)
            else
              nil
            end

          needs_export =
            if file_hash
              i.image_hash.downcase != file_hash
            else
              true
            end

          if needs_export
            to_export << {
              file: file,
              person_id: i.person_id,
              slug: speaker['slug'],
              meta_file: meta_file,
              meta: meta,
              hash_file: hash_file,
              hash: i.image_hash.downcase,
              thumb_file: thumb_file,
              thumb_meta: thumb_meta,
              thumb_meta_file: thumb_meta_file,
            }
          else
            $cache_tree_after << file << thumb_file << hash_file << meta_file << thumb_meta_file
          end #needs_export
        end #each i
        log(:high, "loaded #{counter} speaker photo hashes, #{to_export.size} need to be exported", Time.now - t)

        before_export = Time.now
        to_export.each do |todo|
          t = Time.now
          i = PersonImage.where(person_id: todo.fetch(:person_id)).first
          fail "failed to find person_image for person_id \"#{todo[:person_id]}\"" unless i
          speaker = speaker_by_person_id.fetch(todo.fetch(:person_id))
          dt = Time.now - t

          image = nil
          begin
            require 'RMagick'
            image = Magick::Image.from_blob(i.image).first
            [
              { f: todo[:file],       mw: $photo_width, mh: $photo_height, m: todo[:meta],       mf: todo[:meta_file]       },
              { f: todo[:thumb_file], mw: $thumb_width, mh: $thumb_height, m: todo[:thumb_meta], mf: todo[:thumb_meta_file] },
            ].each do |x|
              t = Time.now
              blob, width, height = if image.rows > x[:mw] or image.columns > x[:mh]
                                      [ image.resize_to_fill(x[:mw], x[:mh]).to_blob, x[:mw], x[:mw] ]
                                    else
                                      [ i.image, image.columns, image.rows]
                                    end

              yf(x[:f], blob, t)

              meta = begin
                       meta = x[:m].clone
                       meta['height'] = height
                       meta['width'] = width
                       meta
                     end

              File.open(x[:mf], 'wb') do |f|
                f.write(meta.to_yaml)
              end
              $cache_tree_after << x[:mf]
            end

            File.open(todo.fetch(:hash_file), 'wb') do |f|
              f.write(todo.fetch(:hash))
            end
            $cache_tree_after << todo.fetch(:hash_file)

          ensure
            image.destroy! if image
          end
        end
        log(:high, "exported #{to_export.size} speaker photos", Time.now - before_export)
      end
      after_photos = Time.now
      start_time += (after_photos - before_photos)

      tree = {
        'conference' => conference,
        'days' => hash_by(days, 'slug'),
        'rooms' => hash_by(rooms, 'slug'),
        'tracks' => hash_by(tracks, 'slug'),
        'events' => hash_by(events, 'slug'),
        'speakers' => hash_by(speakers, 'slug'),
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
        def self.find_empty_dirs(dir)
          list = []
          require 'find'
          if File.exists? dir
            Find.find(dir) do |d|
              next if d == dir
              next unless File.directory? d

              # see http://stackoverflow.com/questions/5059156/check-if-directory-is-empty-in-ruby
              if (Dir.entries(d) - %w{ . .. }).empty?
                list << d
              end
            end
          end
          list
        end

        # we have to iterate until we can't find any empty directories any more,
        # as removing one empty directory can yield other empty directories as
        # empty too
        $export_roots.each do |export_root|
          empty_dirs = find_empty_dirs(export_root)
          until empty_dirs.empty?
            empty_dirs.each do |d|
              unless $export_roots.include? d
                FileUtils.rmdir d
                Nanoc::CLI::Logger.instance.file(:high, :delete, d)
              end
            end
            empty_dirs = find_empty_dirs(export_root)
          end
        end
      end

      log(:high, "cache rendered", Time.now - total_time)

    ensure
      if connection
        connection.disconnect!
        log(:high, "disconnected from Pentabarf database")
      end

    end

    def self.sha(content)
      require 'digest/sha2'
      sha = Digest::SHA256.new
      sha << content
      sha.hexdigest.downcase
    end

    def self.log(prio, message, duration=nil)
      t = if duration
            "[%2.2fs]" % duration
          else
            " " * 7
          end

      Nanoc::CLI::Logger.instance.log(prio, "%s%12s%s  %s  %s" % [ "\e[36;1m", "pentabarf", "\e[0m", t, message ])
    end

  end
end

