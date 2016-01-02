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

      before do
        if accept_json? and not is_authenticated?
          raise "Unauthorized"
        end
      end
    end
  end
end
