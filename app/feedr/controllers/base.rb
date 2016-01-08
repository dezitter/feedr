module Feedr
  module Controller
    class Base < Sinatra::Base
      helpers Helpers
      helpers ::Feedr::Helpers

      def config
        YAML.load_file('./config/application.yml')
      end

      set :root, File.join(File.dirname(__FILE__), '..')
      set :handlebars, {
        :templates => File.join(settings.root, 'templates')
      }

      before do
        redirect_if_not_authorized
      end

      error do
        handlebars :'pages/error', :locals => {
          message: env['sinatra.error'].message
        }
      end
    end
  end
end
