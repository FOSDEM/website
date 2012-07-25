# vim: set ts=2 sw=2 et ai ft=ruby:
module NavigationHelper

	def navigation(path=nil)
    items = @items
    current_path = path or @item_rep.path

    nav, id = begin
                ni = $item_by_id['/navigation/']
                raise "failed to find the /navigation/ item" unless ni
                [ ni[:navigation], ni.identifier ]
              end

		require 'builder'

    def title(item)
      t = if item[:navtitle]
            item[:navtitle]
          else
            item[:title]
          end
      raise "navigation references the item #{item.identifier} but that has no :title" unless t
      t
    end

    def walk(n, xml, id, current_path, level=0)
      if n.is_a? Array
        n.each do |c|
          walk(c, xml, id, current_path, level)
        end

      elsif n.is_a? Hash
        n.each do |ks,v|
          k = ks.to_s
          if k == '/'
            classes = []
            classes << 'active' if current_path == '/'
            classes << 'nav-header'
            c = {}
            c[:class] = classes.join(" ") unless classes.empty?

            xml.li(c) do
              xml.a('Home', :href => '/')
              walk(v, xml, id, current_path, level + 1)
            end

          elsif k[0,1] == '/'
            item = $item_by_id[k]
            raise "failed to find the item with identifier #{k} that is referenced in #{id}" unless item
            raise "navigation references an item #{k} without a representation in #{id}" unless item.path

            classes = []
            classes << 'active' if current_path == item.path
            classes << 'nav-header' if item[:navcat] == true
            c = {}
            c[:class] = classes.join(" ") unless classes.empty?

            xml.li(c) do
              xml.a(title(item), :href => item.path)
              walk(v, xml, id, current_path, level + 1)
            end
          else
            xml.li(:class => 'nav-header') do
              xml.text! k
              walk(v, xml, id, current_path, level + 1)
            end
          end
        end

      elsif n == '/'
        xml.li do
          xml.a('Home', :href => '/')
        end

      elsif n[0,1] == '/'
        item = $item_by_id[n]
        raise "failed to find the item with identifier #{n} that is referenced in #{id}" unless item
        raise "navigation references an item #{n} without a representation in #{id}" unless item.path

        classes = []
        classes << 'active' if current_path == item.path
        classes << 'nav-header' if item[:navcat] == true
        c = {}
        c[:class] = classes.join(" ") unless classes.empty?

        xml.li do
          xml.a(title(item), :href => item.path)
        end

      else
        xml.li do
          xml.text! n
        end
      end

    end

    buffer = ''
		xml = Builder::XmlMarkup.new(:target => buffer, :indent => 2)
    walk(nav, xml, id, current_path)

    buffer
	end

end
