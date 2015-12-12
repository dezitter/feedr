require 'yaml'

Sequel.connect(YAML.load_file('./config/database.yml'))

require 'feedr/helpers/handlebars'
require 'feedr/models/feed'
require 'feedr/models/entry'
require 'feedr/repositories/feed'
require 'feedr/repositories/entry'

module Feedr
  class App < Sinatra::Base

    set :root, File.join(File.dirname(__FILE__), 'feedr')
    set :handlebars, {
      :templates => File.join(settings.root, 'templates')
    }

    set :public_folder, './dist'

    helpers Helpers
  end
end

require 'feedr/middlewares/static'
require 'feedr/controllers/index'
require 'feedr/controllers/feed'
require 'feedr/controllers/entry'
