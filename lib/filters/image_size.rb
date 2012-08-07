# vim: set ts=2 sw=2 et ai ft=ruby:

# Idea from here:
# http://userprimary.net/posts/2011/01/10/optimizing-nanoc-based-websites/

def image_size(s)
  path = case s
         when String
           s
         when ::Nanoc::Item
           s.path
         when ::Nokogiri::XML::Element
           s['src']
         else
           raise "unsupported object of type #{s.class}: #{s.inspect}"
         end

  filepath = if path.start_with? '/'
               "output" + path
             else
               "output/" + path
             end

  $_image_size_cache ||= {}
  hit = $_image_size_cache[path.to_sym]
  unless hit
    require 'image_size'
    i = ImageSize.new(IO.read(filepath))
    hit = [i.height.to_s, i.width.to_s]
    $_image_size_cache[path.to_sym] = hit
  end
  hit
end

class ImageSizeFilter < Nanoc::Filter

  type :text
  identifier :imagesize

  def run(content, params={})
    require 'nokogiri'
    doc, selector = if content =~ %r{^\s*(<!DOCTYPE.+>\s*)?<html}
                      [ ::Nokogiri::HTML.parse(content), '//img[@src]' ]
                    else
                      # needs using .//img here instead of //img because fragments don't have
                      # a root element:
                      # http://stackoverflow.com/questions/8552534/how-can-i-iterate-through-child-nodes-of-a-particular-name-in-a-nokogiri-xml-doc
                      [ ::Nokogiri::HTML.fragment(content), './/img[@src]' ]
                    end
    doc.xpath(selector)
    .reject { |img| img.has_attribute?('width') and img.has_attribute?('height') }
    .select { |img| img['src'] =~ %r{^/|\.\.\/} }
    .each do |img|
      height, width = image_size(img)
      img['height'] = height
      img['width'] = width
    end
    doc.to_xhtml
  end

end

