module Feedr
  class App < Sinatra::Base

    get '/' do
      @title = 'Home'
      mustache :index, :locals => {
        :entries => Entry.all
      }
    end

  end
end
