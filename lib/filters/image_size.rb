# vim: set ts=2 sw=2 et ai ft=ruby:

# Idea from here:
# http://userprimary.net/posts/2011/01/10/optimizing-nanoc-based-websites/

class ImageSizeFilter < Nanoc::Filter

  type :text
  identifier :imagesize

  @@SELECTORS = [ '//img' ]

  def run(content, params={})
    # Set assigns so helper function can be used
    @item_rep = assigns[:item_rep] if @item_rep.nil?

    selectors  = params.fetch(:select) { @@SELECTORS }
    namespaces = params[:namespaces] || {}

    require 'nokogiri'
    klass = ::Nokogiri::HTML

    add_image_size(content, selectors, namespaces, klass, 'xhtml')
  end

  protected
  def add_image_size(content, selectors, namespaces, klass, type)
    # Ensure that all prefixes are strings
    namespaces = namespaces.inject({}) { |new, (prefix, uri)| new.merge(prefix.to_s => uri) }

    doc = content =~ /<html[\s>]/ ? klass.parse(content) : klass.fragment(content)
    selectors.map { |sel| "#{sel}" }.each do |selector|
      doc.xpath(selector, namespaces)
      .select { |node| node.is_a? Nokogiri::XML::Element }
      .select { |img| img.has_attribute?('src') }
      .reject { |img| img.has_attribute?('width') and img.has_attribute?('height') }
      .select { |img| img['src'] =~ %r{^/|\.\.\/} }
      .each do |img|
        path = img['src']
        dimensions = image_size(path)
        dimensions.each{|k,v| img[k.to_s] = v.to_s}
      end
    end
    result = doc.send("to_#{type}")

    result
  end

  def image_size(path)
    require 'image_size'
    path = '/' + path unless path[0, 1] == '/'
    height, width = begin
                      hit = $_image_size_cache[path.to_sym]
                      unless hit
                        img = ImageSize.new(IO.read("output#{path}"))
                        hit = [img.height, img.width]
                        $_image_size_cache[path.to_sym] = hit
                      end
                      hit
                    end
  end

end

