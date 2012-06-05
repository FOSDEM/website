# vim: set ts=2 sw=2 et ai ft=ruby:

class Sponsor
  @@cache = nil
  @@items_cache = nil
  @@basepage = nil

  def initialize(item)
    [:filename, :title, :url].each{|a| raise "sponsor item #{item.inspect} has no mandatory #{a} attribute" if item[a].nil? }

    require 'pathname'
    filename = item[:filename]
    p = Pathname.new(filename)
    # create base for filenames/URLs,
    # e.g. filename == content/sponsor/google.html ---> b == content/sponsor/google
    b = p.to_s.chomp(p.extname.to_s)

    # short identifier,
    # e.g. filename == content/sponsor/google.html --> @id == google
    @id = p.basename.to_s.chomp(p.extname.to_s)

    @logo = {}
    {
      :big => ['-big', ''],
      :small => ['-small'],
    }.each do |kind, suffixes|
      l = []
      suffixes.each do |suffix|
        ['png', 'jpg', 'jpeg'].each do |ext|
          name = "#{b}#{suffix}.#{ext}"
          l << name if Pathname.new(name).readable?
        end
      end
      raise "Found more than one #{kind.to_s} logo for sponsor #{filename}: #{l}" if l.length > 1
      @logo[kind] = l[0] unless l.empty?
    end

    @name = item[:title]
    @url = item[:url]
    @propaganda = item.compiled_content(:snapshot => :pre)
    @cornerstone = !item[:cornerstone].nil?
    @path = item.path
  end

  def id
    @id
  end

  def name
    @name
  end

  def propaganda
    @propaganda
  end

  def path
    @@basepage.path + '#' + self.id
  end

  def cornerstone?
    @cornerstone
  end

  def url
    @url
  end

  def thumb?
    not @logo[:small].nil?
  end

  def thumb
    raise "sponsor #{@name} has no thumb logo" unless self.thumb?
    #relpath(@item_rep.path, locate_item_by_filename(@logo[:small]).path)
    locate_item_by_filename(@logo[:small], @@items_cache).path
  end

  def logo?
    not @logo[:big].nil?
  end

  def logo
    raise "sponsor #{@name} has no logo" unless self.logo?
    #relpath(@item_rep.path, locate_item_by_filename(@logo[:big]).path)
    locate_item_by_filename(@logo[:big], @@items_cache).path
  end

  def self.list(items)
    if @@cache.nil? then
      @@items_cache = items.select{|item| item[:disabled].nil? or not item[:disabled]}
      @@cache = @@items_cache.select{|item| item.sponsor? }.map{|item| Sponsor.new(item)}.sort_by{|s| s.name}
      begin
        l = @@items_cache.select{|item| item[:sponsors_root]}
        raise "failed to find item with attribute :sponsors_root" if l.empty?
        raise "found #{l.length} items with attribute :sponsors_root: #{l}" if l.length > 1
        @@basepage = l[0]
      end
    end
    @@cache
  end

end

def sponsors
  Sponsor.list(@items)
end

