require 'feedr/api/helpers/entry'
require 'feedr/api/helpers/feed'
require 'feedr/api/helpers/values'

module Feedr
  module Api
    class Base < Sinatra::Base
      helpers Sinatra::JSON
      helpers ::Feedr::Helpers
      helpers ::Feedr::Api::Helpers

      set :show_exceptions, false

      def respond(hash=nil)
        return json(hash) if accept_json?

        set_data(hash)
        pass
      end

      before do
        redirect_if_not_authorized
      end

      error do
        json(message: env['sinatra.error'].message)
      end
    end
  end
end
