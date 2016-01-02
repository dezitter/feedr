require_relative './base'

module Feedr
  module Api
    class Entry < Base

      get '/entries/all' do
        entries = EntryRepository.list(limit: params[:limit])
        respond(entries: entries)
      end

      get '/entries/starred' do
        respond(entries: EntryRepository.starred)
      end

      post '/entries/mark-as-read' do
        respond(EntryRepository.mark_all_as_read)
      end

      post '/entry/:id/star' do |id|
        respond(entry: EntryRepository.star(id))
      end

      post '/entry/:id/unstar' do |id|
        respond(entry: EntryRepository.unstar(id))
      end

    end
  end
end
