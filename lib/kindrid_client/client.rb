require 'kindrid_client/configuration'
require 'kindrid_client/validate'

module KindridClient
  class Client

    # @private
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new Client
    def initialize(options={})
      options = KindridClient.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
    
    def consume(request, options = {})
      if !validate(request)
        puts "Incorrect signature"
        return
      end
      
      result = Hashie::Mash.new(request.params)
      result[result.keys.first] if request.params.blank?
    end

    include Validate

  end
end