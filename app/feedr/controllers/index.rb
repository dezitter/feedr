module Feedr
  class App < Sinatra::Base

    get '/' do
      @title = 'Home'
      mustache :index
    end

  end
end
