module Feedr
  class App < Sinatra::Base

    get '/' do
      @title = 'Home'
      mustache :index, :locals => {
        :entries => Entry.order(Sequel.desc(:published)).all.map { |e| e.values }
      }
    end

  end
end
