module Feedr
  module Api
    class Base < Sinatra::Base
      helpers Sinatra::JSON
      helpers ::Feedr::Helpers

      def respond(hash)
        return json(hash) if accept_json?

        set_data(hash)
        pass
      end
    end
  end
end
