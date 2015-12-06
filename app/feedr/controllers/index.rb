module Feedr
  class App < Sinatra::Base

    get '/' do
      @title = 'Home'
      mustache :index, :locals => {
        :entries => Entry.all.map { |e| e.values }
      }
    end

  end
end
