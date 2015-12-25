module Feedr
  class App < Sinatra::Base

    get '/entries/all' do
      handlebars :entries, :locals => {
        title: 'All',
        entries: EntryRepository.list()
      }
    end

    get '/entries/starred' do
      handlebars :entries, :locals => {
        title: 'Starred',
        entries: EntryRepository.starred()
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
