# vim: set ts=2 sw=2 et ai:
module Nanoc3::DataSources
  class Attachments < Nanoc3::DataSource
    identifier :attachments

    def items
      # Get prefix
      prefix = config[:prefix] || 'attachments'

      # Get all files under prefix dir
      filenames = Dir[prefix + '/**/*'].select { |f| File.file?(f) }

      # Convert filenames to items
      filenames.map do |filename|
        attributes = {
          :extension => File.extname(filename)[1..-1],
          :filename  => filename,
        }
        f = filename[(prefix.length+1)..-1]
        identifier = f + '/'
        export = f

        mtime      = File.mtime(filename)
        checksum   = checksum_for(filename)

        item = Nanoc3::Item.new(
          filename,
          attributes,
          identifier,
          :binary => true, :mtime => mtime, :checksum => checksum
        )
        item[:title] = begin
                         require 'pathname'
                         Pathname.new(item[:filename]).basename.to_s
                       end
        item[:kind] = :attachment
        item[:type], v, item[:media], item[:localname] = case filename
                                                         when %r{^attachments/event/([^/]+)/([^/]+)/(.+)$}
                                                           [ :event, $1, $2, $2 + '/' + $3 ]
                                                         else
                                                           raise "unsupported type of attachment: #{filename}"
                                                         end
        item[item[:type]] = v
        item[:export] = export
        item
      end
    end

  private

    # Returns a checksum of the given filenames
    # TODO un-duplicate this somewhere
    def checksum_for(*filenames)
      filenames.flatten.map do |filename|
        digest = Digest::SHA1.new
        File.open(filename, 'r') do |io|
          until io.eof
            data = io.readpartial(2**10)
            digest.update(data)
          end
        end
        digest.hexdigest
      end.join('-')
    end
  end
end
