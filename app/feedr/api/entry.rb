module Feedr
  class App < Sinatra::Base

    get '/api/entries/all' do
      options = { limit: params[:limit] }
      json({ entries: EntryRepository.list(options) })
    end

    get '/api/entries/starred' do
      json({ entries: EntryRepository.starred() })
    end

  end
end
