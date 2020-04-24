# frozen_string_literal: true

require 'eship/version.rb'
require 'eship/api_client.rb'
require 'eship/endpoints.rb'
require 'eship/quotation.rb'

module Eship
  def self.config
    yield self
  end

  def self.version
    @version
  end

  def self.base_uri
    @base_uri
  end

  def self.base_uri=(base_uri)
    @base_uri = base_uri
  end

  def self.eship_key
    @eship_key
  end

  def self.eship_key=(eship_key)
    @eship_key = eship_key
  end
end
