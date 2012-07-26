# vim: set ts=2 sw=2 et ai ft=ruby:

def timetable_from_items(items)
  h = {}
  items.select{|i| i.identifier =~ %r{^/schedule/day/.+}}.sort_by{|d| d[:conference_day]}.map do |day|
    h[day[:slug]] = timetable_from_items_for_day(items, day)
  end
  h
end

def timetable_from_items_for_day(items, day)
    rooms = items.select{|i| i.identifier =~ %r{^/schedule/room/.+}}
    .sort_by{|r| [r[:rank], r[:conference_room_id]]}

    events = items.select{|i| i.identifier =~ %r{^/schedule/event/.+}}
    .select{|e| e[:conference_day_id] == day[:conference_day_id]}
    .sort_by{|e| [e[:start_time], e[:event_id]]}

    conference = items.select{|i| i.identifier == '/schedule/conference/'}.first

    timetable rooms, events, conference[:timeslot_duration]
end

def timetable(rooms, events, timeslot_duration)
  require 'time'

  # compute interval in minutes
  interval = case timeslot_duration
             when nil
               raise "timeslot_duration is nil"
             when String
               t = Time.parse(timeslot_duration)
               raise "timeslot_duration has seconds" unless t.sec == 0
               t.hour * 24 + t.min
             when Time
               raise "timeslot_duration has seconds" unless t.sec == 0
               t.hour * 24 + t.min
             else
               raise "unsupported timeslot_duration of class #{timeslot_duration.class}"
             end

  raise "an interval under 5 minutes, really, are you serious?" if interval < 5

  # convert the interval to seconds as that's what we always need below
  # to use the + operator on Time objects
  interval = interval * 60

  table_by_room = begin
    table = {}
    start_time = Time.parse(events.first[:start_time])
    end_time   = Time.parse(events.last[:end_time])

    rooms.each do |room|
      column = {}
      table[room[:slug]] = column

      now = start_time
      while now <= end_time
        column[now.strftime("%H:%M")] = []
        nb = now
        now += interval
      end
    end #rooms
    table
  end

  table_by_time = begin
                    table = {}
                    start_time = Time.parse(events.first[:start_time])
                    end_time   = Time.parse(events.last[:end_time])

                    now = start_time
                    while now <= end_time
                      row = {}
                      table[now.strftime("%H:%M")] = row
                      rooms.each do |room|
                        row[room[:slug]] = []
                      end #room

                      now += interval
                    end
                    table
                  end

  # so, we have complete and empty tables now, let's fill them with
  # all events
  events.each do |event|
    event_duration_minutes = begin
                               h, m = Time.parse(event[:duration]).strftime("%H:%M").split(':').map(&:to_i)
                               m + (h * 60)
                             end

    # compute with event_duration_minutes converted to seconds, as
    # interval is in seconds
    slots = (event_duration_minutes * 60) / interval

    now = Time.parse(event[:start_time])
    (0..slots-1).each do |slot|
      key = now.strftime("%H:%M")

      cells = [
        table_by_room.fetch(event[:room]).fetch(key),
        table_by_time.fetch(key).fetch(event[:room]),
      ]

      state = case slot
              when 0
                :begin
              when slots-1
                :end
              else
                :inprogress
              end

      meta = {
        event_id: event[:event_id],
        title: event[:title],
        slug: event[:slug],
        state: state,
      }
      meta[:slots] = slots if slot == 0

      cells.each do |cell|
        cell << meta
      end

      now += interval
    end
  end #events

  {
    by_time: table_by_time,
    by_room: table_by_room,
  }
end

