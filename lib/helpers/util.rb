# vim: set ts=2 sw=2 et ai ft=ruby:
# encoding: utf-8

module Fosdem

  def stripext(filename)
    d, b, e = split_filename filename
    if e.size > 0
      b[0..-(e.size + 2)]
    else
      b
    end
  end

  def split_filename(filename)
    d = begin
          d = File.dirname filename
          if d.nil? or d == '' or d == '.'
            nil
          else
            d
          end
        end
    b = File.basename filename
    case b
    when %r{^(.+)\.(([^\.]+)\.(gz|bz|bz2|xz))$}
      [ d, $1, $2 ]
    when %r{^(.+)\.([^\.]+)$}
      [ d, $1, $2 ]
    when %r{^(.+)\.$}
      [ d, $1, '' ]
    when %r{^([^\.]+)$}
      [ d, $1, '' ]
    else
      [ d, filename, '' ]
    end
  end

  def sanitize_filename(filename)
    d, b, e = split_filename(filename)
    require 'active_support/inflector/transliterate'
    require 'active_support/inflector/methods'
    b = ActiveSupport::Inflector
    .transliterate(b)
    .gsub(%r{/+}, '')
    .gsub(%r{\s+}, '_')
    .gsub(/[\s\-\+]+/, '_')
    .gsub(/[\._]+/, '_')
    .gsub(/["']+/, '')
    [ d, "#{b}.#{e}", b, e ]
  end

  def sha_file(filename)
    require 'digest/sha1'
    Digest::SHA1.file(filename).to_s.downcase
  end

  def md5_file(filename)
    require 'digest/md5'
    Digest::MD5.file(filename).to_s.downcase
  end

  def mime_to_extension(mime)
    case mime
    when 'image/png'
      'png'
    when 'image/gif'
      'gif'
    when 'image/jpeg'
      'jpg'
    else
      fail "unsupported image MIME type \"#{mime}\""
    end
  end

  def image_size(filename)
    require 'RMagick'
    image = Magick::Image.from_blob(IO.read(filename)).first
    begin
      [ image.columns, image.rows ]
    ensure
      image.destroy! if image
    end
  end

  def all_exist(*files)
    files.map{|f| File.exists? f}.all?
  end

  def hash_by(ary, key)
    h = {}
    ary.each do |item|
      h[item.fetch(key)] = item
    end
    h
  end

end #Fosdem

