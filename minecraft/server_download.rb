require "httparty"

module Minecraft
  class ServerDownload
    def self.url(version_manifest_url)
      response = HTTParty.get(version_manifest_url)
      response.parsed_response['downloads']['server']['url']
    end
  end
end
