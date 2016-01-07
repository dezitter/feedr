require_relative './base'

module Feedr
  module Api
    class Entry < Base

      get '/' do
        entries = unread_entries(limit: 10)
        respond(entries: entries)
      end

      get '/entries/all' do
        entries = unread_entries(limit: params[:limit])
        respond(entries: entries)
      end

      get '/entries/starred' do
        respond(entries: starred_entries)
      end

      get '/entries/archive' do
        respond(entries: read_entries)
      end

      post '/entries/mark-as-read' do
        updated = entry_repository.mark_all_as_read
        respond(updated: updated)
      end

      post '/entry/:id/star' do |id|
        state = entry_repository.star(id)
        respond(state: state.values)
      end

      post '/entry/:id/unstar' do |id|
        state = entry_repository.unstar(id)
        respond(state: state.values)
      end

    end
  end
end
