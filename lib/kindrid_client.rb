require 'faraday'
require "kindrid_client/version"
require 'kindrid_client/client'
require 'kindrid_client/configuration'

module KindridClient
  extend Configuration
  
  mattr_accessor :key, :secret
  
  # Alias for KindridClient::Client.new
  #
  # @return [KindridClient::Client]
  def self.new(options={})
    KindridClient::Client.new(options)
  end

  # Delegate to KindridClient::Client
  def self.method_missing(method, *args, &block)
    return super unless new.respond_to?(method)
    new.send(method, *args, &block)
  end
end
