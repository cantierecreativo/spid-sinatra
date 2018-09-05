# frozen_string_literal: true

require "sinatra"
require "sinatra/base"

module Spid
  module Sinatra # :nodoc:
    module Helpers # :nodoc:
      def spid_login_path(idp_name:)
        base_path = Spid.configuration.login_path
        query = "idp_name=#{idp_name}"
        "#{base_path}?#{query}"
      end
    end

    ::Sinatra.helpers Helpers
  end
end
