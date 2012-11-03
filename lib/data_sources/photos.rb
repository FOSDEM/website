# vim: set ts=2 sw=2 et ai:
# encoding: UTF-8
module Nanoc3::DataSources
  class Static < Nanoc3::DataSource
    identifier :photos

    def items
      # Get prefix
      prefix = config[:prefix] || 'photos'

      # Get all files under prefix dir
      filenames = Dir[prefix + '/**/*'].select { |f| File.file?(f) }

      # Convert filenames to items
      filenames.map do |filename|
        name, ext = begin
                      ext = File.extname filename
                      name = filename[0..-(ext.size + 1)]
                      if ext and ext =~ %r{^\.(.*)$}
                        ext = $1
                      end
                      [ name, ext ]
                    end

        attributes = {
          :extension => ext,
          :filename  => filename,
        }

        identifier = '/' + name[(prefix.length+1)..-1] + '/'

        mtime      = File.mtime(filename)
        checksum   = checksum_for(filename)

        Nanoc3::Item.new(
          filename,
          attributes,
          identifier,
          :binary => true,
          :mtime => mtime,
          :checksum => checksum,
          :kind => :photo
        )
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
