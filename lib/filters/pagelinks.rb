# vim: set ts=2 sw=2 et ai ft=ruby fileencoding=utf-8:

module Fosdem
  class PageLinks < LinkProcessor
    identifier :pagelinks

    protected

    def qualifies?(url)
      url =~ /^page:/
    end

    def resolve(url)
      raise "URL #{url} does not match page:" unless url =~ /^page:(.+)$/
        require 'pathname'
      curl = $1
      curl.insert(0, '/') unless curl[0,1] == '/'
      curl << '/' unless curl[-1,1] == '/'

      results = @items.select do |item|
        if item.identifier == curl then
          true
        elsif (not item[:title].nil?) and (item[:title].casecmp(curl) == 0) then
          true
        elsif self.match_filename(item, curl) then
          true
        elsif self.match_basename(item, curl) then
          true
        else
          false
        end
      end

      raise "Failed to resolve \"#{url}\" URL" if results.empty?
      raise "Found more than one item that resolves the URL \"#{url}\": #{results}" if results.length > 1
      return results[0].path
    end

    def match_basename(item, q)
      require 'pathname'
      Pathname.new(item.path.nil? ? item.identifier : item.path).basename.to_s == Pathname.new(q).basename.to_s
    end

    def match_filename(item, q)
      return false if item[:filename].nil?
      require 'pathname'
      p = Pathname.new(item[:filename])
      b = p.basename
      n = b.to_s.chomp(b.extname.to_s)
      return n == q
    end

  end

end
