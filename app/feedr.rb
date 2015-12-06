require 'feedr/views/layout'

module Feedr
  class App < Sinatra::Base
    register Mustache::Sinatra

    set :mustache, {
      :views     => File.join(File.dirname(__FILE__), 'feedr', 'views'),
      :templates => File.join(File.dirname(__FILE__), 'feedr', 'templates'),
      :namespace => Feedr
    }

    get '/' do
      @title = 'Home'
      mustache :index
    end

  end
end
