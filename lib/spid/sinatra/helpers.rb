# frozen_string_literal: true

require "sinatra"
require "sinatra/base"

module Spid
  module Sinatra # :nodoc:
    module Helpers # :nodoc:
      def spid_login_path(
            idp_name:,
            authn_context: nil,
            attribute_service_index: nil
          )
        base_path = Spid.configuration.login_path
        query = "idp_name=#{idp_name}"
        unless authn_context.nil?
          query = "#{query}&authn_context=#{authn_context}"
        end

        unless attribute_service_index.nil?
          query = "#{query}&attribute_service_index=#{attribute_service_index}"
        end
        "#{base_path}?#{query}"
      end

      def spid_logout_path(idp_name:)
        base_path = Spid.configuration.logout_path
        query = [
          "idp_name=#{idp_name}"
        ].join("&")
        "#{base_path}?#{query}"
      end
    end

    ::Sinatra.helpers Helpers
  end
end
