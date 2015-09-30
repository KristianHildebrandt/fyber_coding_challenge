require "fyber"
require "httparty"
require 'digest/sha1'

module Fyber
  class Client
    include HTTParty
    base_uri 'api.fyber.com'

    class << self
      def offer_wall(options = {})
        request_params = cleaned(options).merge(hashkey: calculate_hash(options))

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
        stringified(options).sort_by{|k,v| k }
      end

      def stringified(options)
        options.map{|k,v| [k.to_s, v.to_s]}
      end

      def cleaned(options)
        options.delete_if{|k,v| v == nil || v == ""}
      end
    end
  end
end
