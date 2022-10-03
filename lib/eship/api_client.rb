# frozen_string_literal: true
require 'httparty'

module Eship
  module ApiClient
    def self.default_headers
      {
        "content-type" => 'application/json',
        ImmutableKey.new("api-key") => Eship.eship_key 
      }
    end

    def self.post(path:, body: {}, headers: {})
      path = "#{Eship.base_uri}#{path}"
      headers = headers.merge(ApiClient.default_headers)
      response = HTTParty.post(path, body: body.to_json, headers: headers, :debug_output => Eship.verbose ? $stdout :  $stderr)
      JSON.parse(response.body)
    end

    #Monkey patch to avoid headers capitalization https://jatindhankhar.in/blog/custom-http-header-and-ruby-standard-library/
    class ImmutableKey < String 
      def capitalize 
        self 
      end

      def downcase
        self
      end

      def split(*)
        super.map { |s| self.class.new(s) }
      end

      def to_s
        self 
       end 

       alias_method :to_str, :to_s
    end
  end
end
