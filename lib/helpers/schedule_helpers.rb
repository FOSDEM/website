# vim: set ts=2 sw=2 et ai ft=ruby:

# Various helper functions for schedule related
# item massaging

def slug(h)
  case h
  when Hash
    h.fetch(:slug)
  when Nanoc::Item
    h[:slug] or raise "#{h.inspect} has no :slug"
  when Symbol
    h.to_s
  when String
    h
  else
    raise "unsupported type for slug(): #{h.class}: #{h.inspect}"
  end
end

def l(item, title=:title, sep=", ")
  require 'builder'
  case item
  when Array
    item.map{|i| l(i)}.join(sep)
  when Nanoc::Item
    text = case title
           when Symbol
             raise "item \"#{item.inspect}\" has no title attribute \"#{title}\"" unless item[title]
             item[title]
           when String
             title
           else
             title.to_s
           end

    # using XmlMarkup here is a lot slower than just concatenating a string
    # but it is a lot safer against HTML injection (schedule item titles
    # are user input and we don't know 100% whether they are cleaned and/or
    # encoded properly in Pentabarf)
    buffer = ''
    xml = Builder::XmlMarkup.new(:target => buffer, :indent => 0)
    xml.a(text, href: item.path)
    buffer
  else
    raise "unsupported object of type #{item.class}"
  end
end

def ltt(d, time)
  require 'builder'
  d = if d.is_a? Nanoc::Item
        d[:day]
      else
        d
      end
  time = case time
         when Time
           time.strftime("%H:%M")
         when DateTime
           time.to_time.strftime("%H:%M")
         when String
           case time.length
           when 5
             time
           when 8
             time.split(/:/)[0,2].join(":")
           else
             raise "invalid time \"#{time}\""
           end
         else
           raise "unsupported object of type #{time.class}"
         end

  anchor = time.gsub(/:/, '')

  buffer = ''
  xml = Builder::XmlMarkup.new(:target => buffer, :indent => 0)
  xml.a(time, href: "#{$prefix}/schedule/day/#{d}/" + '#' + anchor)
  buffer
end

def conference(sym=nil)
  c = $_conference ||= @items.select{|i| i.identifier == '/schedule/conference/'}.first
  raise "failed to find /schedule/conference/" if c.nil?
  if sym.nil?
    c
  else
    c[sym] or raise "/schedule/conference/ has no meta attribute #{sym}"
  end
end

def speakers(sortby=:person_id)
  list = $_speakers ||= @items.select{|i| i.identifier =~ %r{^/schedule/speaker/.+}}.sort_by{|x| x[:person_id]}
  if sortby == :person_id or sortby == [:person_id]
    list
  else
    list.sort_by{|x| [sortby].flatten.map{|z| x[z]}}
  end
end

def speaker(slug)
  $item_by_id.fetch "/schedule/speaker/#{slug(slug)}/"
end

def days(sortby=:conference_day)
  list = $_days ||= @items.select{|i| i.identifier =~ %r{^/schedule/day/.+}}.sort_by{|x| x[:conference_day]}
  if sortby == :conference_day or sortby == [:conference_day]
    list
  else
    list.sort_by{|x| [sortby].flatten.map{|z| x[z]}}
  end
end

def day(slug)
  $item_by_id.fetch "/schedule/day/#{slug(slug)}/"
end

def tracks(sortby=[:rank, :conference_track_id])
  list = $_tracks ||= @items.select{|i| i.identifier =~ %r{^/schedule/track/.+}}.sort_by{|x| [x[:rank], x[:conference_track_id]]}
  if sortby == [:rank, :conference_track_id]
    list
  else
    list.sort_by{|x| [sortby].flatten.map{|z| x[z]}}
  end
end

def track(slug)
  $item_by_id.fetch "/schedule/track/#{slug(slug)}/"
end

def rooms(sortby=[:rank, :conference_room_id])
  list = $_rooms ||= @items.select{|i| i.identifier =~ %r{^/schedule/room/.+}}.sort_by{|x| [x[:rank], x[:conference_room_id]]}
  if sortby == [:rank, :conference_room_id]
    list
  else
    list.sort_by{|x| [sortby].flatten.map{|z| x[z]}}
  end
end

def room(slug)
  $item_by_id.fetch "/schedule/room/#{slug(slug)}/"
end

def events(sortby=[:start_date, :start_time])
  list = $_events ||= @items.select{|i| i.identifier =~ %r{^/schedule/event/.+}}.sort_by{|x| [x[:start_date], x[:start_time]]}
  if sortby == [:start_date, :start_time]
    list
  else
    list.sort_by{|x| [sortby].flatten.map{|z| x[z]}}
  end
end

def event(slug)
  $item_by_id.fetch "/schedule/event/#{slug(slug)}/"
end

$to_item = lambda{|slug| $item_by_id.fetch slug}
$to_slug = lambda{|item| slug(item)}

$to_event = lambda{|slug| $item_by_id.fetch "/schedule/event/#{slug}/"}
$to_speaker = lambda{|slug| $item_by_id.fetch "/schedule/speaker/#{slug}/"}
$to_day = lambda{|slug| $item_by_id.fetch "/schedule/day/#{slug}/"}
$to_room = lambda{|slug| $item_by_id.fetch "/schedule/room/#{slug}/"}
$to_track = lambda{|slug| $item_by_id.fetch "/schedule/track/#{slug}/"}
$empty_track = lambda{|t| t[:events].empty?}

def pathof(item)
  item = case item
         when Nanoc::Item
           item
         when String
           $item_by_id.fetch item
         else
           raise "unsupported object of type #{item.class} in pathof(): #{item.inspect}"
         end
  item.path
end

$to_path = lambda{|item| pathof item}

def event_is_upcoming_to(e1, e2, limit=15)
  (DateTime.parse(e2[:end_datetime]) .. (DateTime.parse(e2[:end_datetime]) + (limit*60))).include? DateTime.parse(e1[:start_datetime])
end

def event_next_in_room(e1, e2)
  e1[:conference_room_id] == e2[:conference_room_id] and e1[:conference_day_id] == e2[:conference_day_id] and e1[:start_datetime] >= e2[:end_datetime]
end

def event_sametime(e1, e2)
  # discard e2 that starts right after e1, they're picked up by event_is_upcoming_to
  if e1[:start_datetime] == e2[:end_datetime] then
    return false
  end
  if e2[:start_datetime] <= e1[:start_datetime] and e2[:end_datetime] >= e1[:start_datetime] then
    # e2 starts before or at the same time as e1
    # AND
    # e2 ends after or at the same time as e1
    return true
  end
  if e2[:start_datetime] >= e1[:start_datetime] and e2[:start_datetime] < e1[:end_datetime] then
    # e2 starts after e1
    # AND
    # e2 ends before e1
    return true
  end
  return false
end

def navtitle(item)
  if item[:navtitle] then
    item[:navtitle]
  elsif item[:title] then
    item[:title]
  else
    id(item).capitalize
  end
end

def id(item)
  item.identifier.gsub(%r{/+$}, '').split('/')[-1]
end

def interview?(item)
  item[:kind] == 'interview' or item.identifier =~ %r{^/interviews?/.+}
end
def page?(item)
  item[:kind] == 'page' or item.identifier.match(%r{^/(news|headlines|assets|sponsors?|schedule)/}).nil?
end
def news?(item)
  item[:kind] == 'news' or item.identifier.match(%r{^/news/.+}).nil? ? false : true
end
def sponsor?(item)
  item[:kind] == 'sponsor' or (item[:kind] != 'page' and not item.binary? and item.identifier.match(%r{^/sponsors?/.+/}).nil? ? false : true)
end

