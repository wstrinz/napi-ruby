require_relative 'maluuba_napi/version'
require 'httparty'
require 'uri'

module MaluubaNapi
  # Provides simple access to the Maluuba NLP API (http://developer.maluuba.com)
  # for Ruby scripts.
  #
  # Basic usage ...
  #
  #http://napi.maluuba.com/v0/interpret
  class Client

    include HTTParty
    #debug_output $stdout
    base_uri 'http://napi.maluuba.com'

    attr_accessor :auth

    MALUUBA_NAPI = {
      base_url: "http://napi.maluuba.com",
      version:  "v0"
    }

    def initialize(apikey, options={})
      @auth = {}
      @auth[:apikey] = apikey
    end

    def interpret(query_parameters={})
      response = query "/v0/interpret", query_parameters
      symbolize_response response.parsed_response
    end

    def normalize(query_parameters={})
      response = query "/v0/normalize", query_parameters
      symbolize_response response.parsed_response
    end

    private

      def query(endpoint, query_parameters)
        self.class.get create_get_request(endpoint, query_parameters)
      end

      def create_get_request(endpoint, query_parameters)
        endpoint + "?" + encode_query_parameters(query_parameters.merge(@auth))
      end

      def encode_query_parameters(query_parameters)
        URI.encode_www_form(query_parameters)
      end

      def symbolize_response(response)
        symbolized_hash = {}
        response.each_pair do |k,v|
          k == 'entities' ? 
            symbolized_hash[k.to_sym] = v :
            symbolized_hash[k.to_sym] = v.to_sym
        end
        symbolized_hash
      end

  end

end
