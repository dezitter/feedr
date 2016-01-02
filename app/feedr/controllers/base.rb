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
    end
  end
end
