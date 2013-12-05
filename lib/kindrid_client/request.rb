module KindridClient
  module Request
    
    # @private
    private

    # Perform an HTTP GET request
    def request(resource_path, params = {})
      request = construct_request(resource_path, params)

      response = connection.get do |req|
        req.url request[:url], request[:params]
        req.options = request_options
      end
      response.body
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
        builder.use Faraday::Response::Rashify
        builder.use Faraday::Response::ParseJson
        builder.adapter(adapter)
      end
    end
  end
end