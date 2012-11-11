# vim: set ts=2 sw=2 et ai ft=ruby:
module Fosdem

  def navigation(list, opts={})
    show_active = opts.fetch(:active, true)
    accesskeys = opts.fetch(:accesskeys, false)

    list.map do |link|
      target_id = case link
                  when Hash
                    link.values.first
                  else
                    link.to_s
                  end
      target_id = target_id + '/' unless target_id.end_with? '/'
      target = $item_by_id.fetch(target_id)
      title = case link
              when Hash
                link.keys.first.to_s
              else
                if target[:navtitle]
                  target[:navtitle]
                else
                  target[:title]
                end
              end
      css = []
      if show_active
        active = if target_id == '/'
                   @item.path == target.path
                 else
                   @item.path.start_with? target.path
                 end
        css << :active if active
      end
      css << :home if target.identifier == '/'

      cssattr = if css.empty?
                  ""
                else
                  %Q! class="#{css.map(&:to_s).join(' ')}"!
                end

      ak = if accesskeys
             case target.identifier
             when '/'
               "1"
             when '/news/'
               "2"
             when '/search/'
               "4"
             when "/faq/"
               "5"
             else
               nil
             end
           else
             nil
           end

      ak = %Q! accesskey="#{ak}"! if ak

      %Q!<li#{cssattr}><a#{ak} href="#{target.path}">#{title}</a></li>!
    end.join("\n")
  end

end

