# vim: set ts=2 sw=2 et ai ft=ruby:

module Fosdem
  class ScheduleDataSource < ::Nanoc::DataSource
    identifier :schedule

    def items
      time_before = Time.now
      load_items!
      Nanoc::CLI::Logger.instance.log(:high, "%s%12s%s  [%2.2fs]  %s" % [ "\e[1m", "schedule", "\e[0m", Time.now - time_before, "loaded from #{@file}" ])
      @items
    end

    private
    def load_items!
      require 'yaml'
      require 'psych'
      YAML::ENGINE.yamler = 'psych'

      file = @config.fetch(:file)

      if @items.nil?
        time_before = Time.now
        cache, mtime = if File.exists? file
                         [YAML.load_file(file), File.mtime(file)]
                       else
                         [{}, nil]
                       end

        @mtime = mtime
        @file = file

        def to_items(hash, name)
          l = []
          hash.each do |id, meta|
            ["/schedule/#{name}/#{id}/"].each do |identifier|
              l << Nanoc3::Item.new('', meta, identifier, @mtime)
            end
          end
          l
        end

        r = []
        cache.each do |k,v|
          if k[-1] == 's'
            name = k[0..-2]
            v.each do |id, meta|
              r << Nanoc3::Item.new('', meta, "/schedule/#{name}/#{id}/", mtime)
            end
          else
            r << Nanoc3::Item.new('', v, "/schedule/#{k}/", mtime)
          end
        end

        # create items for ical and xcal pages for each track
        # and decorate the track items with :alternative_representations,
        # which is picked up in the layout (and added to the <head/> section)
        # -- note that it would be cleaner to do this in the track template
        # but items cannot be modified once the compile stage is running,
        # including their metadata, which is why we have to do it here
        cache.fetch('tracks').each do |track_slug, track|
          [
            { title: 'iCal', mime: 'text/calendar', item: "/schedule/ical/track/#{track_slug}/" },
            { title: 'xCal', mime: 'text/xml',      item: "/schedule/xcal/track/#{track_slug}/" },
          ].each do |alt|
            #meta = track.clone
            #meta[:layout] = false
            r << Nanoc3::Item.new('', track, alt[:item], mtime)
            track[:alternative_representations] = [] unless track.has_key? :alternative_representations
            track[:alternative_representations] << alt
          end
        end

        @items = r

      end
    end
  end
end
