# frozen_string_literal: true

require 'faraday'

module Eship
  def self.connection
    Faraday.new(url: Eship.api_base) do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['api-key'] = Eship.eship_key
      faraday.use Faraday::Response::RaiseError
    end
  end
end
