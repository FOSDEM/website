# vim: set ts=2 sw=2 et ai ft=ruby fileencoding=utf-8:

# Various helper functions for schedule related
# item massaging

module Fosdem

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

  def img(item, attr={})
    item = $item_by_id.fetch(item) if item.is_a? String and item.start_with? '/' and item.end_with? '/'

    a = attr.clone
    a[:src] = case item
              when Nanoc::Item
                item.path
              when String
                item
              else
                raise "unsupported object of type #{item.class}: #{item.inspect}"
              end

    buffer = ''
    style = begin
              width, height = html_image_size(item)
              a[:width] = width
              a[:height] = height
              "width:#{width}px; height:#{height}px; min-width:#{width}px; min-height:#{height}px;"
            end
    if a.has_key? :style
      a[:style] = a[:style] + " " + style
    else
      a[:style] = style
    end
    %Q!<img #{a.map{|k,v| %Q!#{k}="#{v}"!}.join(" ")}/>!
  end

  def l(item, title=:title, subtitle=:subtitle, sep=", ", detail=nil, klass=nil)
    if item.is_a? String and item.start_with? '/'
      item = $item_by_id.fetch(item)
    end

    case item
    when Array
      item.map{|i| l(i, title, subtitle, sep, detail, klass)}.join(sep)
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
      textsubtitle = case subtitle
                     when Symbol
                       if item[subtitle]
                         item[subtitle]
                       end
                     when String
                       subtitle
                     else
                       subtitle.to_s
                     end
      if textsubtitle and not textsubtitle == ''
        textsubtitle = '<br /><i>' + henc(textsubtitle) + '</i>'
      end

      # using XmlMarkup here is a lot slower than just concatenating a string
      # but it is a lot safer against HTML injection (schedule item titles
      # are user input and we don't know 100% whether they are cleaned and/or
      # encoded properly in Pentabarf)
      title = if detail
                if detail.is_a? Symbol
                  item[detail]
                else
                  detail.to_s
                end
              else
                nil
              end
      args = {
        href: item.path,
      }
      if title
        args[:title] = title
        args[:longdesc] = title
      end
      if klass
        args[:class] = (klass.is_a? Array) ? klass.join(" ") : klass
      end
      %Q!<a#{args.map{|k,v| %Q( #{k}="#{v}")}.join('')}>#{henc text}#{textsubtitle}</a>!
    else
      raise "unsupported object of type #{item.class}"
    end
  end

  def ltt(item, whence, opts={})
    fail "item must be a Nanoc::Item" unless item.is_a? Nanoc::Item
    fail "opts must be a Hash" unless opts.is_a? Hash
    klass = begin
              c = opts.fetch(:css, nil)
              case c
              when nil
                []
              when Array
                c
              else
                [c]
              end
            end
    klass << 'value-title'

    dt = case whence
        when DateTime
          whence
        when :start
          DateTime.parse(item[:start_datetime])
        when :end
          DateTime.parse(item[:end_datetime])
        else
          fail "whence must be either :start or :end or a DateTime but is #{whence.inspect}"
        end
    time = dt.to_time.strftime("%H:%M")
    anchor = time.gsub(/:/, '')
    title = %Q! title="#{dt.iso8601}"!
    css = %Q! class="#{klass.map(&:to_s).join(' ')}"!
    %Q!<a#{css}#{title} href="#{$prefix}/schedule/day/#{item[:day]}/##{anchor}">#{time}</a>!
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

  def speakers(sortby=nil)
    list = $_speakers ||= @items.select{|i| i.identifier =~ %r{^/schedule/speaker/[^/]+/$}}.sort_by{|x| x[:person_id]}
    if sortby.nil? or (sortby.is_a? Symbol and sortby == :person_id) or (sortby.size == 1 and sortby[0] == :person_id)
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

  def events(sortby=nil)
    list = $_events ||= begin
                          @items.select{|i| i.identifier =~ %r{^/schedule/event/[^/]+/$}}.sort_by{|x| [x[:start_date], x[:start_time]]}
                        end
    if sortby.nil? or (sortby.size == 2 and sortby[0] == :start_date and sortby[1] == :start_time)
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
  $to_room_or_nil = lambda{|slug| $item_by_id["/schedule/room/#{slug}/"]}
  $to_track = lambda{|slug| $item_by_id.fetch "/schedule/track/#{slug}/"}
  $empty_track = lambda{|t| t[:events].empty?}

  def _i(identifier)
    $item_by_id.fetch(identifier)
  end

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

  def filesize(item)
    raise "item #{item.inspect} is not binary" unless item.binary?
    raise "item #{item.inspect} is binary but has no filename" unless item[:filename]
    size = File.size item[:filename]
    case
    when size == 1
      "1 byte"
    when size < 1024
      "%d bytes" % size
    when size < 1024 * 1024
      "%.2f KiB" % (size / 1024.0)
    when size < 1024 * 1024 * 1024
      "%.2f GiB" % (size / 1024.0 * 1024)
    else "%.2f GiB" % (size / 1024.0 * 1024 * 1024)
    end
  end

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
    item[:kind] == 'news' or item.identifier.match(%r{^/news/\d\d\d\d-\d\d-\d\d-[^/]+/$}).nil? ? false : true
  end
  def sponsor?(item)
    item[:kind] == 'sponsor' or (item[:kind] != 'page' and not item.binary? and item.identifier.match(%r{^/sponsors?/.+/}).nil? ? false : true)
  end

  # compute room to building associations programatically and using
  # the metadata in content/buildings.yaml
  # (note that the ranking/order of buildings also stems from the order
  # of buildings as defined in content/buildings.yaml
  def build_room_buildings()
    buildings = {}
    $item_by_id.fetch('/buildings/')[:map].each do |building, roomlist|
      roomlist = [] if roomlist.nil?

      bcode = building.to_s.upcase
      list = []
      roomlist.map(&$to_room_or_nil).reject(&:nil?).each do |r|
        list << r
      end
      rooms.select{|r| r[:slug].upcase.start_with? bcode}.each do |r|
        list << r
      end
      buildings[bcode] = list.uniq{|r| r[:slug]}.sort_by{|r| [r[:rank], r[:conference_room_id]]}
      buildings[bcode].each do |r|
        r[:building] = bcode
      end
    end

    # make sure there are no rooms left without a :building meta attribute
    begin
      errors = rooms.select{|r| r[:building].nil? }
      raise "there are #{errors.size} room(s) without a building assignment, please put them into content/building.yaml: #{errors.map{|r| r[:slug]}.join(", ")}" unless errors.empty?
    end

    room_to_building = {}
    buildings.each do |bcode, rooms|
      rooms.each do |r|
        room_to_building[r[:slug]] = bcode
      end
    end

    [ buildings, room_to_building ]
  end

  def deadline(id, format='%A, %e %B %Y')
    @site.config.fetch(:deadlines).fetch(id).sort.last.strftime(format)
  end

  def deadlines(id, format='%e %B %Y', format_current='%A, %e %B %Y')
    deadlines = @site.config.fetch(:deadlines).fetch(id).sort
    if deadlines.size > 1
      current = deadlines.pop
      (deadlines.map{|d| "<del>#{d.strftime(format)}</del>"} + ["<ins>#{current.strftime(format_current)}</ins>"]).join(" ")
    else
      deadlines.first.strftime(format_current)
    end
  end

  def extended_deadline?(id)
    if @site.config.fetch(:deadlines).fetch(id).size > 1
      true
    else
      false
    end
  end

end
