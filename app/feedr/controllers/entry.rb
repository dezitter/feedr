module Feedr
  class App < Sinatra::Base

    get '/entries/starred' do
      handlebars :index, :locals => {
        entries: EntryRepository.list({
          :where => { starred: true }
        })
      }
    end

    post '/entries/mark-as-read' do
      EntryRepository.mark_all_as_read

      redirect to('/')
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
