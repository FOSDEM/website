# vim: set ts=2 sw=2 et ai ft=ruby:

module Fosdem
  def digest(items)
    items = if items.is_a? Array
              items
            else
              [items]
            end


    require 'digest/sha2'

    sha = Digest::SHA256.new

    items.each do |item|
      if item.binary?
        sha.file item[:filename]
      else
        sha << item.raw_content
      end
    end

    sha.hexdigest.downcase
  end
end

