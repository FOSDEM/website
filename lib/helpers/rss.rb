# vim: set ts=2 sw=2 et ai ft=ruby:
# encoding: utf-8

module Fosdem
  def podcast_feed(params = {})
    require 'builder'

    # Extract parameters
    events = params[:events] || []
    excerpt_limit = params.fetch(:excerpt_limit)

    # Define how to find webm video once and reuse
    webm_link = lambda do |e|
      e[:links].find { |link| link[:title].start_with?('Video recording (AV1/WebM)') }
    end
    vtt_link = lambda do |e|
      e[:links].find { |link| link[:title].start_with?('Video recording subtitle file (VTT)') }
    end

    # Filter and sort events by video publish date
    events.select!(&webm_link)
    events.select!(&vtt_link)
    events = events.sort_by do |e|
      webm_link.call(e)[:created] or
        raise RuntimeError.new("Cannot build Podcast RSS feed: event with id #{e[:event_id]} has a webm video link with no created attr")
    end.reverse

    # Check config attributes
    if @site.config[:base_url].nil?
      raise RuntimeError.new('Cannot build RSS feed: site configuration has no base_url')
    end

    last_update = events.any? ? DateTime.parse(webm_link.call(events.first)[:created]) : DateTime.now
    last_update = last_update.rfc822() # rss preferred format

    buffer = ''
    xml = Builder::XmlMarkup.new(:target => buffer, :indent => 2)

    year = days.first[:conference_day].year.to_s
    title = "FOSDEM #{year}"
    description = 'Video recordings of FOSDEM talks - new episodes are released when videos become available. '\
      'FOSDEM is a free event for software developers to meet, share ideas and collaborate. '\
      'Every year, thousands of developers of free and open source software from all over the world gather at the event in Brussels.'
    organization = 'FOSDEM VZW'
    author_email = 'info@fosdem.org'
    author_email_rfc = "#{author_email} (FOSDEM Info)"
    root_url = @site.config[:base_url]
    year_url = root_url + "/#{year}"
    podcast_image = "#{year_url}/support/promote/box.png"

    # Build feed
    xml.instruct!
    xml.rss(version: '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom',
            'xmlns:itunes' => 'http://www.itunes.com/dtds/podcast-1.0.dtd',
            'xmlns:podcast' => 'https://podcastindex.org/namespace/1.0') do
      xml.channel do
        xml.link "#{year_url}/"
        # http://validator.w3.org/appc/docs/warning/MissingAtomSelfLink.html
        xml.atom :link, href: root_url + @item.path, rel: 'self', type: 'application/rss+xml'
        xml.title title
        xml.description description
        xml.language 'en-us'
        xml.copyright "#{year} #{organization}"
        xml.podcast :locked, 'yes'
        xml.podcast :funding,
                    'While FOSDEM is primarily funded by sponsors and the sale of t-shirts, '\
                    'we also gratefully accept voluntary donations.',
                    url: "#{year_url}/support/donate/"
        xml.lastBuildDate(last_update)
        xml.pubDate(last_update)
        xml.ttl('1800')
        xml.image do
          xml.url podcast_image
          xml.title title
          xml.link "#{year_url}/"
        end
        xml.itunes :type, 'episodic'
        xml.itunes :subtitle, "All the recordings from this year's event in Brussels."
        xml.itunes :category, text: 'Technology'
        xml.itunes :author, organization
        xml.itunes :summary, description
        xml.itunes :image, href: podcast_image
        xml.itunes :owner do
          xml.itunes :name, organization
          xml.itunes :email, author_email
        end

        # Add event recordings as podcast items
        events.each do |e|
          video_link = webm_link.call(e)
          transcript_link = vtt_link.call(e)
          excerpt = \
            "<p>#{excerpt_words(html_to_text(e[:abstract]), excerpt_limit, '...')}</p>" \
            "<p>Speakers: #{e[:speakers].map { |s| speaker(s)[:public_name] }.join(', ')}. " \
            "Track: #{e[:track_full_name]}. Room: #{e[:room_name]}.</p>"
          url = url_for(e)
          next if url.nil?

          xml.item do
            xml.title       "[#{e[:track_full_name]}] #{e[:title]}"
            xml.guid        url
            xml.pubDate     DateTime.parse(video_link[:created]).rfc822()
            xml.author      author_email_rfc
            xml.link        url
            xml.description excerpt
            xml.enclosure   url: video_link[:url], type: 'video/webm'
            xml.podcast     :transcript, url: transcript_link[:url], type: 'text/vtt'
            xml.itunes      :episodetype, 'full'
            xml.itunes      :author, organization
            unless e[:subtitle].to_s.strip.empty?
              xml.itunes :subtitle, e[:subtitle]
            end
          end
        end
      end
    end

    buffer
  end

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

