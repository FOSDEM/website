# vim: set ts=2 sw=2 et ai ft=ruby:
module Fosdem

  def bcrumbs(opts={})
    require 'builder'

    separator = opts.fetch(:separator, nil)

    # smarter breadcrumbs, preprocess here
    path = case @item.identifier
           when %r{^/schedule/room/(.+)/$}
             building = $room_to_building.fetch($1)
             [
               { title: conference()[:title], id: '/' },
               { title: 'Schedule', id: '/schedule/' },
               { title: 'Rooms', id: '/schedule/rooms/' },
               { title: building, id: '/schedule/buildings/' },
               { id: @item.identifier }
             ]
           when %r{^/schedule/track/(.+)/$}
             t = case (@item[:type] or :undefined).to_sym
                 when :maintrack
                   { title: "Main Tracks" }
                 when :devroom
                   { title: "Devrooms" }
                 else
                   nil
                 end
             [
               { title: conference()[:title], id: '/' },
               { title: 'Schedule', id: '/schedule/' },
               { title: 'Tracks', id: '/schedule/tracks/' },
               t,
               { id: @item.identifier }
             ].reject(&:nil?)
           when %r{^/schedule/event/(.+)/$}
             t = case (@item[:type] or :undefined).to_sym
                 when :devroom
                   { title: "Devrooms" }
                 when :maintrack
                   { title: "Main Tracks" }
                 else
                   nil
                 end
             [
               { title: conference()[:title], id: '/' },
               { title: 'Schedule', id: '/schedule/' },
               { title: 'Events', id: '/schedule/events/' },
               t,
               { id: "/schedule/track/#{@item[:track]}/" },
               { id: @item.identifier }
             ].reject(&:nil?)
           else
             accumulator = ''
             @item.identifier.chop.split('/').map do |p|
               title, id, a = case p
                              when ''
                                [ conference()[:title], '/' ]
                              when '/'
                                [ conference()[:title], '/' ]
                              when 'track'
                                [ 'Tracks', '/schedule/tracks/', '/schedule/track/' ]
                              when 'schedule'
                                [ 'Schedule', '/schedule/' ]
                              when 'speaker'
                                [ 'Speakers', '/schedule/speakers/', '/schedule/speaker/' ]
                              when 'room'
                                [ 'Rooms', '/schedule/rooms/', '/schedule/room/' ]
                              else
                                [ nil, accumulator + p + '/' ]
                              end
               accumulator = a ? a : id
               { title: title, id: id }
             end
           end

    list = path.each_with_index.map do |p, i|
      title, uri = if p[:id]
                     item = $item_by_id[p[:id]]
                     if item
                       title = if p[:title]
                                 p[:title]
                               elsif item[:navtitle]
                                 item[:navtitle]
                               else
                                 item[:title]
                               end
                       [ title, item.path ]
                     elsif p[:title]
                       [ p[:title], nil ]
                     else
                       [ p[:id].capitalize, nil ]
                     end
                   elsif p[:title]
                     [ p[:title], nil ]
                   else
                     fail "breadcrumbs item for #{@item.identifier} has neither identifier nor title: #{p.inspect}"
                   end

      title = $1 if title =~ /^(.+)\s+devroom$/i
      title = $1 if title =~ /^(.+)\s+track$/i and uri =~ %r{^/schedule/track/.+}

      if i == path.size - 1
        %Q!<li class="active">#{title}</li>!
      elsif uri
        %Q!<li><a href="#{uri}">#{title}</a></li>!
      else
        %Q!<li>#{title}</li>!
      end
    end

    if separator
      list = list.each_with_index.map do |item, i|
        if i > 0
          [ %Q!<li class="separator">#{separator}</li>!, item ]
        else
          [ item ]
        end
      end.flatten
    end

    list.join('')
  end

end

