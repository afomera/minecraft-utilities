require "httparty"

require_relative "versions"

module Minecraft
  class ServerDownload
    def self.latest_manifest_url(stable = true)
      if stable
        Minecraft::Versions.releases.first["url"]
      else
        Minecraft::Versions.snapshots.first["url"]
      end
    end

    def self.url(version_manifest_url)
      response = HTTParty.get(version_manifest_url)
      response.parsed_response["downloads"]["server"]["url"]
    end

    def self.jar(stable: true)
      manifest_url = latest_manifest_url(stable)
      puts manifest_url
      url(manifest_url)
    end
  end
end
