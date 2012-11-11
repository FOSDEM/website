# vim: set ts=2 sw=2 et ai ft=ruby:
module Fosdem

  def bcrumbs
    require 'builder'

    rootitem = $item_by_id['/']
    roottitle = conference :title #rootitem[:name]

    $_bcrumbs_cache ||= begin
      c = {}
      @items.each do |i|
        if i.binary? or i.reps.empty? then
          c[i.identifier] = {
            :title => id(i)
          }
        else
          c[i.identifier] = {
            :title => navtitle(i),
            :link => i.identifier
          }
        end
      end
      c
    end

    buffer = ''
		xml = Builder::XmlMarkup.new(:target => buffer, :indent => 2)

    if @item.identifier == '/' then
      xml.li(:class => 'active home') do
        if roottitle.start_with? '<%'
          xml << roottitle
        else
          xml.text! roottitle
        end
      end
    else
      xml.li(:class => 'home') do
        xml.a(roottitle, :href => "#{$prefix}/")
      end
      #xml.span("/", :class => 'divider')
    end

    parts = @item.identifier.gsub(%r{^/}, '').gsub(%r{/$}, '').split('/')
    parts.each_with_index do |part, index|
      here = '/'+parts[0,index+1].join('/')+'/'
      ref = $_bcrumbs_cache[here]

      if index == parts.length - 1 then
        # active
        xml.li(:class => 'active') do
          t = navtitle @item
          if t.start_with? '<%'
            xml << t
          else
            xml.text! t
          end
        end
      else
        link, title = case part
                      when 'track'
                        ['/schedule/tracks/', 'Tracks']
                      when 'schedule'
                        ['/schedule/', 'Schedule']
                      when 'event'
                        ['/schedule/events/', 'Events']
                      when 'speaker'
                        ['/schedule/speakers/', 'Speakers']
                      when 'room'
                        [ '/schedule/rooms/', 'Rooms' ]
                      else
                        if ref
                          [ ref[:link], ref[:title] ]
                        else
                          [ nil, part ]
                        end
                      end
        xml.li do
          if link then
            xml.a(title.to_sym, :href => "#{$prefix}/#{link}")
          else
            if title.start_with? '<%'
              xml << title
            else
              xml.text! title
            end
          end
          #xml.span("/", :class => 'divider')
        end #li
      end
    end

    buffer
  end

end

