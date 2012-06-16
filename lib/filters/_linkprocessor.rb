# vim: set ts=2 sw=2 et ai ft=ruby:

class LinkProcessor < Nanoc::Filter
  type :text

  require 'nanoc/helpers/link_to'
  include Nanoc::Helpers::LinkTo

  @@SELECTORS = [ 'a/@href', 'img/@src', 'script/@src', 'link/@href' ]

  def run(content, params={})
    # Set assigns so helper function can be used
    @item_rep = assigns[:item_rep] if @item_rep.nil?

    selectors  = params.fetch(:select) { @@SELECTORS }
    namespaces = params[:namespaces] || {}

    require 'nokogiri'
    klass = ::Nokogiri::HTML

    nokogiri_process(content, selectors, namespaces, klass, 'xhtml')
  end

  protected
  def nokogiri_process(content, selectors, namespaces, klass, type)
    # Ensure that all prefixes are strings
    namespaces = namespaces.inject({}) { |new, (prefix, uri)| new.merge(prefix.to_s => uri) }

    doc = content =~ /<html[\s>]/ ? klass.parse(content) : klass.fragment(content)
    selectors.map { |sel| "descendant-or-self::#{sel}" }.each do |selector|
      doc.xpath(selector, namespaces).each do |node|
        if qualifies?(node.content) then
          newurl = resolve(node.content)
          relurl = relpath(@item.identifier, newurl)
          node.content = newurl
        end
      end
    end
    result = doc.send("to_#{type}")

    result
  end

  def qualifies?(url)
    raise NotImplementedError, "this is an abstract template class"
  end

  def resolve(url)
    raise NotImplementedError, "this is an abstract template class"
  end

end
