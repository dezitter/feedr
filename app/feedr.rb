require 'yaml'

Sequel.connect(YAML.load_file('./config/database.yml'))

require 'feedr/services/extracter'
require 'feedr/models/feed'
require 'feedr/models/entry'
require 'feedr/repositories/feed'
require 'feedr/repositories/entry'
require 'feedr/views/layout'

module Feedr
  class App < Sinatra::Base
    register Mustache::Sinatra

    set :root, File.join(File.dirname(__FILE__), 'feedr')
    set :mustache, {
      :views     => File.join(settings.root, 'views'),
      :templates => File.join(settings.root, 'templates'),
      :namespace => Feedr
    }

    set :public_folder, './dist'

    use Rack::Static, {
      urls: ['/assets'],
      root: File.join(settings.root, '/public')
    }
  end
end

require 'feedr/controllers/index'
require 'feedr/controllers/feed'
require 'feedr/controllers/entry'
