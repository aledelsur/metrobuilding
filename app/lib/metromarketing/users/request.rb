# frozen_string_literal: true

module Metromarketing
  module Users
    class Request
      def self.post(user)
        response = Metromarketing::Connection.api.post('users') do |req|
          req.headers['Content-Type'] = 'application/json'
          req.body = user.attributes.merge(extra_information(user)).to_json
        end

        if response.success?
          JSON.parse(response.body)
        else
          {status: response.status, message: response.body}
        end
      end

      def self.extra_information(user)
        {
          intranet_coming_from: configatron.intranet_name,
          amount_of_properties: user.properties.count
        }
      end
    end
  end
end
