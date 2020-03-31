# vim: set ts=2 sw=2 et ai ft=ruby fileencoding=utf-8:

module Fosdem
  class Sponsor
    $cache = nil
    $items_cache = nil
    $basepage = nil

    attr_reader :id, :name, :propaganda, :section, :url

    def initialize(item)
      [:filename, :title, :url].each { |a| raise "sponsor item #{item.inspect} has no mandatory #{a} attribute" if item[a].nil? }

      # short identifier,
      # e.g. filename == content/sponsor/google.html --> @id == google
      @id = begin
              item[:filename].split('/')[-1].split('.')[0..-2].join('.')
            end

      b = item.identifier.chop

      @logo = {}
      %w{big small}.each do |kind|
        id = b + '-' + kind + '/'
        @logo[kind.to_sym] = id if $item_by_id.has_key? id
      end

      @name = item[:title]
      @url = item[:url]
      @propaganda = item.compiled_content(:snapshot => :pre)
      @cornerstone = item[:cornerstone] == true
      @path = item.path
      @section = item[:section].nil? ? '' : item[:section]
      @attribs = item.attributes
    end

    def include_in_toplevel?
      @section == '' or @attribs[:include_in_toplevel]
    end

    def path
      $basepage.path + '#' + self.id
    end

    def cornerstone?
      @cornerstone
    end

    def url?
      not @url.nil?
    end

    def thumb?
      not @logo[:small].nil?
    end

    def thumb
      raise "sponsor #{@name} has no thumb logo" unless self.thumb?

      $item_by_id.fetch(@logo[:small])
    end

    def logo?
      not @logo[:big].nil?
    end

    def logo
      raise "sponsor #{@name} has no logo" unless self.logo?

      $item_by_id.fetch(@logo[:big])
    end

    def order
      @attribs[:order].nil? ? 100 : @attribs[:order]
    end

    def self.list(items)
      $cache ||= begin
                   $items_cache = items.reject { |item| item[:disabled] == true or item[:enabled] == false }
                   h = $items_cache.select { |item| sponsor?(item) }.map { |item| Sponsor.new(item) }.sort_by { |s| [s.order, s.name.downcase] }
                   begin
                     l = $items_cache.select { |item| item[:sponsors_root] }
                     raise "failed to find item with attribute :sponsors_root" if l.empty?
                     raise "found #{l.length} items with attribute :sponsors_root: #{l}" if l.length > 1

                     $basepage = l[0]
                   end
                   h
                 end
    end
  end

  def sponsors
    Sponsor.list(@items)
  end
end

