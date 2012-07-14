# vim: set ts=2 sw=2 et ai ft=ruby:
module BCrumbs

  class Error < RuntimeError; end

  def bcrumbs
    require 'builder'

    rootitem = $item_by_id['/']
    roottitle = rootitem[:name]

    $cache ||= begin
      c = {}
      @items.each do |i|
        if i.binary? or i.reps.empty? then
          c[i.identifier] = {
            :title => i.id
          }
        else
          c[i.identifier] = {
            :title => i.navtitle,
            :link => i.identifier
          }
        end
      end
      c
    end

    buffer = ''
		xml = Builder::XmlMarkup.new(:target => buffer, :indent => 2)

    if @item.identifier == '/' then
      xml.li(:class => 'active') do
        xml.text! roottitle
      end
    else
      xml.li do
        xml.a(roottitle, :href => '/') #$rootitem.navtitle, :href => relpath(@item_rep.path, $rootitem.path))
      end
      xml.span("/", :class => 'divider')
    end

    parts = @item.p.split('/')
    parts.each_with_index do |part, index|
      here = '/'+parts[0,index+1].join('/')+'/'
      ref = $cache[here]

      if index == parts.length - 1 then
        # active
        xml.li(:class => 'active') do
          xml.text! @item.navtitle
        end
      else
        link, title = case part
                      when 'track'
                        ['/schedule/tracks/', 'Tracks']
                      when 'schedule'
                        #['/schedule/', 'Schedule']
                        [ nil, 'Schedule' ]
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
            xml.a(title, :href => link) #relpath(@item_rep.path, link))
          else
            xml.text! title
          end
          xml.span("/", :class => 'divider')
        end #li
      end
    end

    buffer
  end

end

