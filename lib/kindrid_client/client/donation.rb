module KindridClient
  module Donation
    
    def donations(donor_id = nil, options={})
      params = {}
      params.merge!(options)

      # clear empty key/value pairs
      params.reject! { |key, value| value.nil? }
      
      if donor_id.blank?
        request("donations", params).results
      else
        request("donors/#{donor_id}/donations", params).results
      end
    end
    
    def donation(id, options={})
      params = {}
      params.merge!(options)

      # clear empty key/value pairs
      params.reject! { |key, value| value.nil? }

      request("donations/#{id}", params).results.first 
    end
    
  end
end