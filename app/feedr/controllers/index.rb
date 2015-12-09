module Feedr
  class App < Sinatra::Base

    get '/' do
      mustache :index, :locals => {
        entries: EntryRepository.list
      }
    end

  end
end
