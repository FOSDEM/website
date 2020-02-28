# vim: set ts=2 sw=2 et ai ft=ruby fileencoding=utf-8:

# Idea from here:
# http://userprimary.net/posts/2011/01/10/optimizing-nanoc-based-websites/

module Fosdem
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
        width, height = html_image_size(img)
        img['height'] = height
        img['width'] = width
        style = "width:#{width}px; height=#{height}px; min-width:#{width}px; min-height:#{height}px;"
        if img.has_attribute? 'style'
          img['style'] = img['style'] + " " + style
        else
          img['style'] = style
        end
      end
      doc.to_xhtml
    end
  end

  def html_image_size(s)
    s = $item_by_id.fetch(s) if s.is_a? String and s.start_with? '/' and s.end_with? '/'

    path = case s
           when Nanoc::Item
             s[:filename] #.identifier.chop + "." + s[:extension]
           when ::Nokogiri::XML::Element
             "content/#{s['src']}"
           when String
             raise "wtf, a string? #{s.inspect}"
           else
             raise "unsupported object of type #{s.class}: #{s.inspect}"
           end

    $_image_size_cache ||= {}
    hit = $_image_size_cache[path.to_sym]
    unless hit
      w, h = image_size(path)
      hit = [w, h]
      $_image_size_cache[path.to_sym] = hit
    end
    hit
  end
end
