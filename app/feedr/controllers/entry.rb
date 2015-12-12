module Feedr
  class App < Sinatra::Base

    get '/entries/starred' do
      handlebars :index, :locals => {
        entries: EntryRepository.list({
          :where => { starred: true }
        })
      }
    end

    post '/entry/:id/star' do |id|
      EntryRepository.star(id)

      redirect to('/')
    end

    post '/entry/:id/unstar' do |id|
      EntryRepository.unstar(id)

      redirect to('/')
    end

  end
end
