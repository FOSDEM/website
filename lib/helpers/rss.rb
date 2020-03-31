# vim: set ts=2 sw=2 et ai ft=ruby:
# encoding: utf-8

module Fosdem
  def rss_feed(params = {})
    require 'builder'

    # Extract parameters
    limit             = params[:limit] || 5
    relevant_articles = params[:articles] || articles || []

    # Check config attributes
    if @site.config[:base_url].nil?
      raise RuntimeError.new('Cannot build RSS feed: site configuration has no base_url')
    end

    excerpt_limit = params.fetch(:excerpt_limit)

    # Check feed item attributes
    title = params[:title] || @item[:title] || @site.config[:title]
    if title.nil?
      raise RuntimeError.new('Cannot build RSS feed: no title in params, item or site config')
    end

    # Check article attributes
    if relevant_articles.empty?
      raise RuntimeError.new('Cannot build RSS feed: no articles')
    end
    if relevant_articles.any? { |a| a[:created_at].nil? }
      raise RuntimeError.new('Cannot build RSS feed: one or more articles lack created_at')
    end

    # Get sorted relevant articles
    sorted_relevant_articles = relevant_articles.sort_by do |a|
      a[:created_at]
    end.reverse.first(limit)

    # Get most recent article
    last_article = sorted_relevant_articles.first

    # Create builder
    buffer = ''
    xml = Builder::XmlMarkup.new(:target => buffer, :indent => 2)

    # Build feed
    xml.instruct!
    xml.rss(version: '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom') do
      xml.channel do
        root_url = @site.config[:base_url]
        xml.link root_url + '/'
        # http://validator.w3.org/appc/docs/warning/MissingAtomSelfLink.html
        xml.method_missing :'atom:link', href: root_url + @item.path, rel: 'self', type: 'application/rss+xml'
        xml.title title
        xml.description "#{conference()[:title]} News Feed"
        t = last_article[:created_at]
        xml.lastBuildDate(t)
        xml.pubDate(t)
        xml.ttl('1800')

        # Add articles
        sorted_relevant_articles.each do |a|
          # Get URL
          url = url_for(a)
          next if url.nil?

          excerpt = excerpt_words(html_to_text(a.compiled_content), excerpt_limit)

          xml.item do
            xml.title       a[:title]
            xml.guid        url
            xml.pubDate     a[:created_at]
            xml.link        url
            xml.description excerpt
          end
        end
      end
    end

    buffer
  end

  private

  def rss_tag_for(item)
    hostname, base_dir = %r{^.+?://([^/]+)(.*)$}.match(@site.config[:base_url])[1..2]

    formatted_date = item[:created_at]

    'tag:' + hostname + ',' + formatted_date + ':' + base_dir + (item.path || item.identifier)
  end
end

