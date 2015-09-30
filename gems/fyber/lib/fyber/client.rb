require "fyber"
require "httparty"
require 'digest/sha1'

module Fyber
  class Client
    include HTTParty
    base_uri 'api.fyber.com'

    class << self
      def offer_wall(options = {})
        request_params = options.merge(hashkey: calculate_hash(options))

        get('/feed/v1/offers.json', query: request_params)
      end

      private

      def calculate_hash(options)
        Digest::SHA1.hexdigest(parameterize(options))
      end

      def parameterize(options)
        sorted_options(options).map{|a| "#{a[0]}=#{a[1]}"}.join("&")+"&#{Fyber.configuration.api_key}"
      end

      def sorted_options(options)
        options.sort_by{|k,v| k}
      end
    end
  end
end
