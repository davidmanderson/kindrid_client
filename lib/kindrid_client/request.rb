module KindridClient
  module Request
    
    # Perform an HTTP GET request
    def get(resource_path, params = {})
      request = construct_request(resource_path, params)

      response = connection.get do |req|
        req.url request[:url], request[:params]
        req.options = request_options
      end
      Hashie::Mash.new(response.body)
    end
    
    def post(resource_path, data)
      request = construct_request(resource_path)

      response = connection.post do |req|
        req.url request[:url]
        req.body = data.to_json
        req.options = request_options
      end
      Hashie::Mash.new(response.body)
    end
    
    def put(resource_path, data)
      request = construct_request(resource_path)

      response = connection.put do |req|
        req.url request[:url]
        req.body = data.to_json
        req.options = request_options
      end
      Hashie::Mash.new(response.body)
    end
    
    def delete(resource_path)
      request = construct_request(resource_path)

      response = connection.delete do |req|
        req.url request[:url]
        req.options = request_options
      end
      Hashie::Mash.new(response.body)
    end
    
    def construct_request(resource_path, params={})
      request = {}
      request[:url] = "#{Configuration::DEFAULT_ENDPOINT}/#{resource_path}"
      request[:params] = params.merge({client_id: KindridClient.key})  
      request    
    end

    def connection
      options = {
        :headers => {'Accept' => 'application/json', 'User-Agent' => user_agent},
        :url => api_endpoint,
      }

      Faraday.new(options) do |builder|
        builder.basic_auth(KindridClient.key, KindridClient.secret)
        builder.request  :json
        builder.adapter(adapter)
      end
    end
  end
end