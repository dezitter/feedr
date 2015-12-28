require 'yaml'

Sequel.connect(YAML.load_file('./config/database.yml'))

require 'feedr/helpers/auth'
require 'feedr/helpers/handlebars'
require 'feedr/helpers/params'
require 'feedr/helpers/view'
require 'feedr/models/user'
require 'feedr/models/feed'
require 'feedr/models/entry'
require 'feedr/repositories/user'
require 'feedr/repositories/feed'
require 'feedr/repositories/entry'

module Feedr
  class App < Sinatra::Base
    helpers Sinatra::JSON
    helpers Helpers

    set :root, File.join(File.dirname(__FILE__), 'feedr')
    set :dist, File.join(settings.root, '..', '..', 'dist')
    set :handlebars, {
      :templates => File.join(settings.root, 'templates')
    }

    use Rack::PostBodyContentTypeParser
    use Rack::Session::Cookie, secret: ENV['SESSION_SECRET']

    before do
      if is_route_restricted? and not is_authenticated?
        redirect to('/login')
      end
    end

    use Rack::Deflater
    use Rack::Static, {
      urls: ['/assets'],
      root: File.join(settings.root, '/public')
    }
    use Rack::Static, {
      urls: ['/css', '/js'],
      root: settings.dist
    }
  end
end

require 'feedr/controllers/user'
require 'feedr/controllers/home'
require 'feedr/controllers/feed'
require 'feedr/controllers/entry'
require 'feedr/api/feed'
require 'feedr/api/entry'
