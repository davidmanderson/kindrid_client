module KindridClient
  module Tag
    
    module Extensions
      
      def put(data)
        KindridClient.put("donors/#{self.donor_id}/tags", data)
      end
      
      def delete(tag_key)
        KindridClient.delete("donors/#{self.donor_id}/tags/#{tag_key}")
      end
            
    end
    
    def tags(donor_id, options={})
      params = {}
      params.merge!(options)

      # clear empty key/value pairs
      params.reject! { |key, value| value.nil? }

      # add donor_id to results and allow put and delete methods
      get("donors/#{donor_id}/tags", params).tap { |response| 
        response.class.instance_eval do
          define_method(:donor_id) do
            response.metadata.resultset.donorID
          end
        end
      }.results.extend(Extensions)
    end    

  end
end