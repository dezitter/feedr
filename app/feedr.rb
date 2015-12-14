require 'yaml'

Sequel.connect(YAML.load_file('./config/database.yml'))

require 'feedr/helpers/auth'
require 'feedr/helpers/handlebars'
require 'feedr/helpers/params'
require 'feedr/models/user'
require 'feedr/models/feed'
require 'feedr/models/entry'
require 'feedr/repositories/user'
require 'feedr/repositories/feed'
require 'feedr/repositories/entry'

module Feedr
  class App < Sinatra::Base
    helpers Helpers

    set :root, File.join(File.dirname(__FILE__), 'feedr')
    set :handlebars, {
      :templates => File.join(settings.root, 'templates')
    }

    set :public_folder, './dist'

    use Rack::Session::Cookie, secret: ENV['SESSION_SECRET']

    before do
      if is_route_restricted? and not is_authenticated?
        redirect to('/login')
      end
    end

    use Rack::Static, {
      urls: ['/assets', '/css/vendor/'],
      root: File.join(settings.root, '/public')
    }
  end
end

require 'feedr/controllers/user'
require 'feedr/controllers/index'
require 'feedr/controllers/feed'
require 'feedr/controllers/entry'
