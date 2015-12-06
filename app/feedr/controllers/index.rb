module Feedr
  class App < Sinatra::Base

    get '/' do
      @title = 'Home'
      mustache :index, :locals => {
        entries: [
          { :title => 'Foo' },
          { :title => 'Bar' },
          { :title => 'Quz' }
        ]
      }
    end

  end
end
