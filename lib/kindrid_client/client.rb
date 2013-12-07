require 'kindrid_client/configuration'
require 'kindrid_client/validate'
require File.expand_path('../request', __FILE__)

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
      unless options[:validate] == false
        if !validate(request)
          puts "Incorrect signature"
          return
        end
      end
      
      result = Hashie::Mash.new(request.params)
      result[result.keys.first] if request.params.blank?
    end
    
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}
    
    alias :api_endpoint :endpoint

    include Validate
    include Request
    include Donation
    include Donor
  end
end