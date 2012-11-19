# vim: set ts=2 sw=2 et ai ft=ruby fileencoding:utf-8:

module Fosdem
  class CssLinks < Nanoc::Filter
    type :text
    identifier :csslinks

    def run(content, params={})
      @item_rep = assigns[:item_rep] if @item_rep.nil?

      content.gsub(%r{url\(["']?(.+?)["']?\)}) do
        raw = $1
        if raw =~ %r{^(https?|ftps?|mailto)://}
          "url(#{raw})"
        else
          id, e = begin
                    f = if raw.start_with? '/'
                          raw
                        else
                          expand_path @item.identifier.chop.split('/')[0..-2].join('/') + '/' + raw
                        end
                    r = f.rindex '.'
                    if r
                      [ f[0..r-1], f[r+1..-1] ]
                    else
                      [ f, '' ]
                    end
                  end

          id << '/' unless id.end_with? '/'

          target = $item_by_id.fetch(id) do
            fail "#{@item.identifier}: references \"#{raw}\" but failed to find matching identifier \"#{id}\""
          end
          fail "#{@item.identifier}: references \"#{raw}\" and the matching identifier \"#{id}\" exists, but the extension does not match: item has #{target[:extension]}" unless target[:extension] == e

          "url(#{target.path})"
        end
      end

    end
  end
end
