# frozen_string_literal: true

require "httparty"

module Minecraft
  class Versions
    VERSION_MANIFEST = "https://launchermeta.mojang.com/mc/game/version_manifest.json"

    def self.all
      game_versions
    end

    def self.releases
      game_versions.find_all { |version| version["type"] == "release" }
    end

    def self.snapshots
      game_versions.find_all { |version| version["type"] == "snapshot" }
    end

    def self.game_versions
      response = HTTParty.get(VERSION_MANIFEST)
      response.parsed_response["versions"]
    end
  end
end
