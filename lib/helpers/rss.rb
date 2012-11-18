# vim: set ts=2 sw=2 et ai ft=ruby:
# encoding: utf-8
module Fosdem
  def rss_feed(params={})
    require 'builder'

    # Extract parameters
    limit             = params[:limit] || 5
    relevant_articles = params[:articles] || articles || []
    content_proc      = params[:content_proc] || lambda { |a| a.compiled_content }
    excerpt_proc      = params[:excerpt_proc] || lambda { |a| a[:excerpt] }

    # Check config attributes
    if @site.config[:base_url].nil?
      raise RuntimeError.new('Cannot build RSS feed: site configuration has no base_url')
    end

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
      attribute_to_time(a[:created_at])
    end.reverse.first(limit)

    # Get most recent article
    last_article = sorted_relevant_articles.first

    # Create builder
    buffer = ''
    xml = Builder::XmlMarkup.new(:target => buffer, :indent => 2)

    # Build feed
    xml.instruct!
    xml.rss(version: '2.0') do
      xml.channel do
        root_url = @site.config[:base_url] + '/'
        xml.link    root_url
        xml.title   title
        xml.description "#{conference()[:title]} News Feed"
        xml.lastBuildDate(attribute_to_time(last_article[:created_at]).to_iso8601_time)
        xml.pubDate(attribute_to_time(last_article[:created_at]).to_iso8601_time)
        xml.ttl('1800')

        # Add articles
        sorted_relevant_articles.each do |a|
          # Get URL
          url = url_for(a)
          next if url.nil?

          xml.item do
            xml.title       a[:title]
            xml.guid        rss_tag_for(a)
            xml.pubDate     rss_attribute_to_time(a[:created_at]).to_iso8601_time
            xml.link        url
            xml.description a.compiled_content
          end
        end
      end
    end

    buffer
  end

  private
  def rss_tag_for(item)
    hostname, base_dir = %r{^.+?://([^/]+)(.*)$}.match(@site.config[:base_url])[1..2]

    formatted_date = attribute_to_time(item[:created_at]).to_iso8601_date

    'tag:' + hostname + ',' + formatted_date + ':' + base_dir + (item.path || item.identifier)
  end

  def rss_attribute_to_time(time)
    time = Time.local(time.year, time.month, time.day) if time.is_a?(Date)
    time = Time.parse(time) if time.is_a?(String)
    time
  end

end

