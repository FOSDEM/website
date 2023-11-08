module Fosdem
    class Pretalx
      require 'net/http'    
      def self.update(config)
        conf = config.fetch :pretalx
        api_token = conf.fetch :api_key
        meta_export_file = conf.fetch :meta_export_file
  
        uri = URI("https://pretalx.fosdem.org/fosdem-2024/schedule/export/NanocExporter")
        req = Net::HTTP::Get.new(uri)
        # This token can be found at https://pretalx.fosdem.org/fosdem-2024/me/
        req['Authorization'] = "Token " + api_token
  
        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') { |http|
          http.request(req)}
        
        File.open(meta_export_file, 'w') { |file| file.write(res.body) }
      end
    end
end
  