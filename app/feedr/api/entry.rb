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

    private
      def unread_entries(options={})
        entries = entry_repository.unread(options)
        all_as_values_with_state(entries)
      end

      def read_entries(options={})
        entries = entry_repository.read(options)
        all_as_values(entries)
      end

      def starred_entries(options={})
        entries = entry_repository.starred(options)
        all_as_values(entries)
      end

      def all_as_values_with_state(entries)
        @states_hash = entry_repository.states_hash

        all_as_values(entries) { |e| entry_state(e) }
      end

      def entry_state(entry)
        if @states_hash.has_key?(entry.id)
          state = @states_hash[entry.id].values
          state = { read: state[:read], starred:  state[:starred] }
        else
          state = { read: false, starred:  false }
        end
        state
      end

    end
  end
end
