# frozen_string_literal: true

module Metromarketing
  module Users
    class Request
      def self.post(user)
        response = Metromarketing::Connection.api.post('users') do |req|
          req.headers['Content-Type'] = 'application/json'
          req.body = user.to_json
        end

        if response.success?
          JSON.parse(response.body)
        else
          {status: response.status, message: response.body}
        end
      end
    end
  end
end
