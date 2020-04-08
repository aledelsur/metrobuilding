# frozen_string_literal: true

module Metromarketing
  class Connection
    def self.api
      Faraday.new(url: Rails.application.secrets.metromarketing_url)
    end
  end
end