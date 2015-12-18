module Feedr
  class App < Sinatra::Base

    get '/' do
      handlebars :home, :locals => {
        title: 'Home',
        entries: EntryRepository.list(limit: 10)
      }
    end

  end
end
