module KindridClient
  module Donor
    
    def donors(options={})
      params = {}
      params.merge!(options)

      # clear empty key/value pairs
      params.reject! { |key, value| value.nil? }

      get("donors", params).results
    end
    
    def donor(id, options={})
      params = {}
      params.merge!(options)

      # clear empty key/value pairs
      params.reject! { |key, value| value.nil? }

      get("donors/#{id}", params).results.first
    end
    
  end
end