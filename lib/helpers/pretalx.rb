module Fosdem
    class Pretalx
      require 'net/http'    
      def self.update(config)
        conf = config.fetch :pretalx
        meta_export_file = conf.fetch :meta_export_file
        conference_slug = conf.fetch :conference_slug
        pretalx_host = conf.fetch :host

        uri = URI(pretalx_host + "/" + conference_slug + "/schedule/export/NanocExporter")
        req = Net::HTTP::Get.new(uri)
  
        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') { |http|
          http.request(req)}
        
        File.open(meta_export_file, 'w') { |file| file.write(res.body) }
      end
    end
end
