require 'yaml'

Sequel.connect(YAML.load_file('./config/database.yml'))

require 'feedr/services/extracter'
require 'feedr/models/feed'
require 'feedr/models/entry'
require 'feedr/views/layout'

module Feedr
  class App < Sinatra::Base
    register Mustache::Sinatra

    set :mustache, {
      :views     => File.join(File.dirname(__FILE__), 'feedr', 'views'),
      :templates => File.join(File.dirname(__FILE__), 'feedr', 'templates'),
      :namespace => Feedr
    }

    set :public_folder, './dist'

  end
end

require 'feedr/controllers/index'
require 'feedr/controllers/feed'
require 'feedr/controllers/entry'
