require_relative 'maluuba_napi/version'
require_relative 'maluuba_napi/configuration'
require 'httparty'
require 'uri'

module MaluubaNapi
  # Provides simple access to the Maluuba NLP API (http://developer.maluuba.com)
  # for Ruby scripts.
  #
  # Basic Usage:
  # 
  #   client = MaluubaNapi::Client.new 'insert_apikey_here'
  #   client.interpret phrase: 'who is barack obama'
  #   client.normalize phrase: 'tomorrow', type: 'daterange', timezone: 'EST'
  #
  # For more information see http://github.com/Maluuba/napi-ruby 
  # Also visit us on our IRC channel at #maluuba on irc.freenode.net 
  class Client

    include HTTParty
    base_uri MaluubaNapi::Configuration::BASE_URI

    # Creates a new client object
    # @param [String] apikey the consumer_key given
    # @param option [Hash] options optional parameters
    def initialize(apikey, options={})
      @auth = {}
      @auth[:apikey] = apikey
    end

    # Calls the {http://developer.maluuba.com/interpret-api Interpret Endpoint}
    # @param [Hash] query_parameters a hash of query parameters, :phrase is required
    # @return [Hash] a hash consisting of :entities, :category and :action
    def interpret(query_parameters={})
      query "/#{MaluubaNapi::Configuration::VERSION}/interpret", query_parameters      
    end

    # Calls the {http://developer.maluuba.com/normalize-api Normalize Endpoint}
    # @param [Hash] query_parameters a hash of query parameters, :phrase and :type required
    # @return [Hash] a hash consisting of :entities and :context
    def normalize(query_parameters={})
      query "/#{MaluubaNapi::Configuration::VERSION}/normalize", query_parameters
    end

    private

      def query(endpoint, query_parameters)
        response = self.class.get create_get_request(endpoint, query_parameters)
        symbolize_response response.parsed_response
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
