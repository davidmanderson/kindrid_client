module KindridClient
  module Validate
    
    private
    
    def validate(request)
      message = "#{request.url}#{request.body.read}"
      digest = OpenSSL::Digest::Digest.new('sha1')
      hmac = OpenSSL::HMAC.hexdigest(digest, KindridClient.key, message)
      request_hmac = request.headers["X-Kindrid-Signature"]

      hmac == request_hmac
    end
    
  end
end