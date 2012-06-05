# vim: set ts=2 sw=2 et ai ft=ruby:

def sub(here=@item)
  raise "current item may not be nil" if here.nil?
  require 'builder'
  buffer = ''
  xml = Builder::XmlMarkup.new(:target => buffer, :indent => 2)

  xml.ul do
    @items.select{|item| (not item.parent.nil?) and item.parent.identifier == here.identifier}.each do |item|
      xml.li do
        xml.a(item.navtitle, :href => relpath(here.identifier, item.identifier))
      end #li
    end #items
  end #ul
end

