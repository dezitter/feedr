module Feedr
  class App < Sinatra::Base

    get '/' do
      handlebars :index, :locals => {
        entries: EntryRepository.list
      }
    end

  end
end
