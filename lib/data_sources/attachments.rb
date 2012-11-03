# vim: set ts=2 sw=2 et ai:
module Nanoc3::DataSources
  class Attachments < Nanoc3::DataSource
    identifier :attachments

    def items
      # Get prefix
      prefix = config[:prefix] || 'attachments'
      id_prefix = config[:identifier_prefix] || prefix

      # Get all files under prefix dir
      filenames = Dir[prefix + '/**/*'].select { |f| File.file?(f) }

      # Convert filenames to items
      filenames.map do |fs_filename|
        filename, extension, mime = begin
                                      n = normalize(fs_filename)
                                      extension = File.extname(fs_filename[1..-1])
                                      if extension != n[:ext].to_s
                                        extension = n[:ext].to_s
                                        filename = begin
                                                     dirname = begin
                                                                 d = File.dirname fs_filename
                                                                 if d.nil? or d.empty? or d == '.'
                                                                   nil
                                                                 else
                                                                   d
                                                                 end
                                                               end
                                                     basename = File.basename fs_filename

                                                     dot_index = basename.index '.'
                                                     new_basename = if dot_index
                                                                      basename[0, dot_index] + "." + extension
                                                                    else
                                                                      basename + "." + extension
                                                                    end

                                                     if dirname
                                                       File.join(dirname, new_basename)
                                                     else
                                                       new_basename
                                                     end
                                                   end
                                      else
                                        filename = fs_filename
                                      end
                                      [ filename, extension, n[:mime] ]
                                    end

        attributes = {
          :extension => extension,
          :filename  => filename,
        }
        identifier, export = begin
                               ext = File.extname(fs_filename)
                               unprefixed = fs_filename[(prefix.length+1)..-1]

                               normalized_id = begin
                                                 basename = unprefixed[0..-(ext.size + 1)]
                                                 .gsub(/\s+/, '_')

                                                 require 'active_support/inflector/transliterate'
                                                 require 'active_support/inflector/methods'
                                                 ActiveSupport::Inflector.transliterate basename
                                               end

                               [
                                 '/' + id_prefix + '/' + normalized_id + '/',
                                 unprefixed
                               ]
                             end

        mtime      = File.mtime(fs_filename)
        checksum   = checksum_for(fs_filename)

        item = Nanoc3::Item.new(
          fs_filename,
          attributes,
          identifier,
          :binary => true,
          :mtime => mtime,
          :checksum => checksum
        )
        item[:filesystem] = fs_filename
        item[:title] = File.basename item[:filename]
        item[:kind] = :attachment
        item[:type], v, item[:media], item[:localname] = case filename
                                                         when %r{^attachments/event/([^/]+)/([^/]+)/(.+)$}
                                                           [ :event, $1, $2, $2 + '/' + $3 ]
                                                         else
                                                           raise "unsupported type of attachment: #{fs_filename}"
                                                         end
        item[item[:type]] = v
        item[:export] = export
        item[:mime] = mime
        item
      end
    end

  private
    def normalize(filename)
      mime, ext = begin
                    require 'filemagic'
                    magic = FileMagic.new.file(filename)
                    case magic
                    when /^html document/i
                      ['text/html', :html]
                    when /^ogg.*\btheora video/i
                      ['video/ogg', :ogv]
                    when /^opendocument presentation$/i
                      ['application/vnd.oasis.opendocument.presentation', :odp]
                    when /^pdf document/i
                      ['application/pdf', :pdf]
                    when /\btar archive/i
                      ['application/x-tar', :tar]
                    when /^apple quicktime movie/i
                      ['video/quicktime', :mov]
                    when /^webm$/i
                      ['video/webm', :webm]
                    when /^iso media, mpeg v4 system/i
                      ['video/mp4', :mpeg]
                    when /^zip archive/i
                      case filename
                      when /\.zip$/
                        ['application/zip', :zip]
                      when /\.odp$/
                        ['application/vnd.oasis.opendocument.presentation', :odp]
                      else
                        raise "unsupported file extension for filename \"#{filename}\" for magic \"#{magic}\""
                      end
                    when /^(gzip|bzip2) compressed data/
                      case filename
                      when /\.(tar\.gz|tgz)$/
                        ['application/x-compressed-tar', :"tar.gz"]
                      when /\.(tar\.bz2|tbz|tbz2)$/
                        ['application/x-bzip-compressed-tar', :"tar.bz2"]
                      else
                        raise "unsupported filename \"#{filename}\" for magic type \"#{magic}\""
                      end
                    else
                      raise "unsupported magic type \"#{magic}\" for attachment #{filename}"
                    end
                  end
      { mime: mime, ext: ext }
    end

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
