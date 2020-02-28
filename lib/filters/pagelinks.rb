# vim: set ts=2 sw=2 et ai ft=ruby fileencoding=utf-8:

module Fosdem
  class PageLinks < Nanoc::Filter
    type :text
    identifier :pagelinks

    def run(content, params={})
      @item_rep = assigns[:item_rep] if @item_rep.nil?
      require 'nokogiri'

      doc = if content =~ /<html[\s>]/
              Nokogiri::HTML.parse(content)
            else
              Nokogiri::HTML.fragment(content)
            end

      {
        a: { href: [ :page, :asset, :event, :track, :speaker, :day, :room ], child: true, },
        img: { src:  [ :asset ], title: true, alt: true, image: true, },
        link: { src: [ :asset ] },
        script: { src: [ :src ] },
      }.each do |tag, x|
        tag = tag.to_s
        attr = x.keys.first.to_s
        types = x.values.first
        options = x

        doc.xpath(".//#{tag}")
           .select{|a| a.has_attribute? attr}.each do |elem|
          orig = elem[attr]
          if orig =~ /^(page|asset|event|track|speaker|day|room):(.+)$/
            type = $1.to_sym
            fail "#{@item.identifier} #{@item.path}: #{elem.to_xhtml} has link type #{type.to_s}, which is not supported" unless types.include? type

            id, year = begin
                         m = $2
                         if m =~ %r{^(\d{4})[:/](.+)$}
                           [ $2, $1 ]
                         else
                           [ m, nil ]
                         end
                       end

            link =
              if year
                "https://archives.fosdem.org/#{year}/#{id}.html"
              else
                id = case type
                     when :page
                       id
                     when :asset
                       "/assets/#{id}"
                     when :event
                       "/schedule/event/#{id}"
                     when :track
                       "/schedule/track/#{id}"
                     when :speaker
                       "/schedule/speaker/#{id}"
                     when :day
                       "/schedule/day/#{id}"
                     when :room
                       "/schedule/room/#{id}"
                     else
                       fail "unsupported URL type #{type.to_s}"
                     end
                id, anchor = if id =~ %r{^(.+)#(.+)$}
                               [ $1, $2 ]
                             else
                               [ id, nil ]
                             end

                id.insert(0, '/') unless id.start_with? '/'
                id << '/' unless id.end_with? '/'
                id.gsub!(%r{/+}, '/')

                target = $item_by_id[id]
                fail "#{@item[:filename]} (#{@item.path}): #{elem.to_xhtml} references #{id} but there is no such identifier" unless target

                if target[:title]
                  elem << target[:title] if options[:child] == true and not elem.child
                  [:title, :alt].each do |k|
                    elem[k.to_s] = target[:title] if options[k] == true and not elem.has_attribute? k.to_s
                  end
                end

                if options[:image] == true and not (elem.has_attribute? 'height' and elem.has_attribute? 'width')
                  w, h = image_size(target[:filename])
                  elem['width'] = w.to_s
                  elem['height'] = h.to_s
                end

                if anchor
                  target.path + '#' + anchor
                else
                  target.path
                end
              end
            fail "link target is not a rendered page: #{target.identifier}" unless link

            elem[attr] = link
          end
        end
      end
      doc.to_xhtml
    end
  end
end
