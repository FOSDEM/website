# vim: set ts=2 sw=2 et ai ft=ruby:

module Fosdem
  def make_headlines
    @items.select{|item| news?(item) }.each do |item|
      fqid = id(item)
      if item.identifier =~ %r,(^/news/)(\d{4}-\d{2}-\d{2})-(.+)$, then
        #item.identifier = $1 + $3
        item[:kind] = 'article'
        item[:created_at] = Time.parse($2)

        id = "/headlines/#{fqid}"
        attrs = item.attributes.reject {|k,v| k == :filename or k == :file}
        attrs[:kind] = 'headline'
        attrs[:hidden] = true
        attrs[:layout] = false

        content = item.raw_content
        headline_content = content
        begin
          if content =~ /^(.+)---\s*MORE\s*---\s*$(.+)/m then
            headline_content = $1
            content = $1 + $2
            #item.raw_content = content
            attrs[:readmore] = item.identifier
          elsif content =~ /^(.+)---\s*FULL\s*---\s*$(.+)/m then
            headline_content = $1
            content = $2
            #item.raw_content = content
            attrs[:readmore] = item.identifier
          end
        end

        mtime = item.mtime
        headline = Nanoc::Item.new(headline_content, attrs, id, { :mtime => mtime, :binary => false })
        headline[:fullpost] = item.identifier

        # also put the headline text into the item (used when rendering the atom feed)
        item[:headline] = headline_content

        # add the headline item to the list of items
        @items << headline
      else
        raise "news file name does not start with a date (YYYY-MM-DD-...): #{item.identifier}"
      end
    end
  end

  def make_newspages
    list = []
    pages = @items
    .select{|i| news?(i)}
    .sort_by{|i| i[:created_at]}
    .reverse
    .each_slice(@config.fetch(:news).fetch(:news_page_items).to_i)
    .map(&:to_a)

    pages.each_with_index do |newsitems, i|
      p = i + 1
      id = if i > 0
             "/news/#{p}/"
           else
             "/news/"
           end
      newspage = Nanoc::Item.new('', {kind: 'newspage'}, id, { mtime: newsitems.first.mtime, binary: false})
      newspage[:newsitems] = newsitems.map{|i| i.identifier}
      newspage[:page] = p
      newspage[:pages] = pages.size
      newspage[:title] = (pages.size > 1) ? "News (#{p} of #{pages.size})" : "News"
      newspage[:titlehead] = false

      headlinks = [ { rel: 'canonical', href: id } ]
      if p > 1
        prev = if p > 2
                 "/news/#{p - 1}/"
               else
                 "/news/"
               end
        headlinks << { rel: 'prev', href: prev }
      end
      if p < pages.size
        headlinks << { rel: 'next', href: "/news/#{p + 1}/" }
      end
      newspage[:headlinks] = headlinks

      list << newspage
    end
    list.first[:navtitle] = 'News'
    list.each{|i| @items << i}
  end
end
