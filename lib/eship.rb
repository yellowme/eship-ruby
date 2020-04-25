require 'eship/version.rb'

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
