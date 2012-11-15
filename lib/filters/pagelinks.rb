# vim: set ts=2 sw=2 et ai ft=ruby fileencoding=utf-8:

module Fosdem
  class PageLinks < LinkProcessor
    identifier :pagelinks

    protected

    def qualifies?(url)
      url =~ /^page:/
    end

    def resolve(url)
      curl = if url =~ /^page:(.+)$/
               $1
             else
               url
             end
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

      fail "#{@item.identifier}: failed to resolve \"#{url}\" URL" if results.empty?
      fail "#{@item.identifier}: found more than one item that resolves the URL \"#{url}\": #{results}" if results.length > 1
      return results[0].path
    end

    def match_basename(item, q)
      File.basename(item.path.nil? ? item.identifier : item.path) == File.basename(q)
    end

    def match_filename(item, q)
      return false if item[:filename].nil?
      b = File.basename item[:filename]
      n = b.chomp(File.extname item[:filename])
      n == q
    end

  end

end
