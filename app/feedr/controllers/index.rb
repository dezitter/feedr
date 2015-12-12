module Feedr
  class App < Sinatra::Base

    get '/' do
      handlebars :index, :locals => {
        title: 'Home',
        entries: EntryRepository.list
      }
    end

  end
end
