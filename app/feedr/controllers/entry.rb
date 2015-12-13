module Feedr
  class App < Sinatra::Base

    get '/entries/all' do
      entries = EntryRepository.list()

      handlebars :entries, :locals => {
        title: 'All',
        entries: entries
      }
    end

    get '/entries/starred' do
      entries = EntryRepository.list({
        :where => { starred: true }
      })

      handlebars :entries, :locals => {
        title: 'Starred',
        entries: entries
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
