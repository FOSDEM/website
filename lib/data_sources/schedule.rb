# vim: set ts=2 sw=2 et ai ft=ruby:

module Fosdem
  class ScheduleDataSource < ::Nanoc::DataSource
    identifier :schedule

    def items
      time_before = Time.now
      load_items!
      Nanoc::CLI::Logger.instance.log(:low, "%s%12s%s  [%2.2fs]  %s" % [ "\e[1m", "schedule", "\e[0m", Time.now - time_before, "loaded from #{@file}" ])
      @items
    end

    def update
      Fosdem::Pentabarf.update(@site.config)
    end

    private
    def load_items!
      require 'yaml'
      require 'psych'
      YAML::ENGINE.yamler = 'psych'

      require 'time'

      file = @site.config.fetch(:pentabarf).fetch(:meta_export_file)

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
          hash.map do |id, meta|
            Nanoc3::Item.new('', meta, "/schedule/#{name}/#{id}/", @mtime)
          end
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
            r << Nanoc3::Item.new('', track, alt[:item], mtime)
            track[:alternative_representations] = [] unless track.has_key? :alternative_representations
            track[:alternative_representations] << alt
          end
        end

        memory = {}
        {
          attachments: 'attachment',
          eventlogos: 'eventlogo',
          photos: 'photo',
          thumbnails: 'thumbnail',
        }.each do |key, kind|
            crawl(key, :kind => kind.to_sym) do |filename, meta|
              id = meta.delete('identifier')
              fail "duplicate: #{id}\n#{memory[id].inspect} (#{memory[id][:filename]})" if memory[id]
              i = Nanoc3::Item.new(filename, meta, id, {binary: true})
              memory[id] = i
              i
            end.each{|x| r << x}
        end

        @items = r

      end
    end

    def crawl(dir, opts={}, &block)
      fail "no block?" unless block_given?

      dir = @site.config.fetch(:pentabarf).fetch(:export_roots).fetch(dir) if dir.is_a? Symbol

      Dir[File.join(dir, '/**/*')]
      .select{|f| File.file?(f)}
      .reject{|f| f =~ /\.(hash|yaml)$/}
      .map do |filename|
        d, s, name, ext = sanitize_filename filename

        meta_filename = File.join([d, "#{name}.yaml"].reject(&:nil?))
        meta = YAML.load_file(meta_filename)
        meta[:checksum] = sha_file(filename)
        meta[:mtime] = File.mtime(filename)
        meta[:extension] = ext
        meta[:filename] = File.join(d, s)
        opts.each{|k,v| meta[k] = v}

        yield filename, meta
      end
    end

  end
end
