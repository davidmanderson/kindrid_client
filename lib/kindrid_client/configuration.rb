require 'faraday'
require File.expand_path('../version', __FILE__)

module KindridClient
  # Defines constants and methods related to configuration
  module Configuration

    # An array of valid keys in the options hash when configuring
    VALID_OPTIONS_KEYS = [:user_agent].freeze

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "Kindrid Client Gem #{KindridClient::VERSION}".freeze

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end
    
    # Reset all configuration options to defaults
    def reset
      self.user_agent       = DEFAULT_USER_AGENT
    end

  end
end