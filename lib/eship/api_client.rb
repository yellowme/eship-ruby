# frozen_string_literal: true

module Eship
  module ApiClient
    def self.post(path:, body:, headers: {})
      response = Eship.connection.post path, body, headers
      response.body
    end
  end
end
