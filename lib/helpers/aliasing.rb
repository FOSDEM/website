# vim: set ts=2 sw=2 et ai ft=ruby fileencoding=utf-8:

module Fosdem
  def dup_item(item, new_identifier)
    new_identifier.insert(0, '/') unless new_identifier[0,1] == '/'
    new_identifier << '/' unless new_identifier[-1,1] == '/'
    a = {
      :mtime => item.mtime,
      :binary => item.binary?,
      :alias_of => item.identifier,
    }
    if item.binary?
      a[:filename] = item[:filename]
      content = item[:filename]
    else
      content = item.raw_content
    end

    Nanoc::Item.new(content, item.attributes, new_identifier, a)
  end

  def make_aliases
    @items.each do |item|
      unless item[:aliases].nil? then
        item[:aliases].split(/[,\s]+/).each do |a|
          a.insert(0, '/') unless a[0,1] == '/'
          a << '/' unless a[-1,1] == '/'
          next if a == item.identifier

          attrs = item.attributes.reject {|k,v| k == :aliases}
          copy = Nanoc::Item.new(item.raw_content, attrs, a, { :mtime => item.mtime, :binary => item.binary? })
          copy[:alias_of] = item.identifier
          @items << copy
        end
      end
    end
  end
end

