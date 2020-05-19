# frozen_string_literal: true

module Metromarketing
  class Connection
    def self.api
      Faraday.new(url: configatron.metromarketing_api_url)
    end
  end
end