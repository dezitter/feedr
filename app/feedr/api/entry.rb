require_relative './base'

module Feedr
  module Api
    class Entry < Base

      get '/' do
        entries = entry_repository.unread(limit: 10)
        respond(entries: all_as_values(entries))
      end

      get '/entries/all' do
        entries = entry_repository.unread(limit: params[:limit])
        respond(entries: all_as_values(entries))
      end

      get '/entries/starred' do
        entries = entry_repository.starred
        respond(entries: all_as_values(entries))
      end

      get '/entries/archive' do
        entries = entry_repository.read
        respond(entries: all_as_values(entries))
      end

      post '/entries/mark-as-read' do
        updated = entry_repository.mark_all_as_read
        respond(updated: updated)
      end

      post '/entry/:id/star' do |id|
        entry = entry_repository.star(id)
        respond(entry: entry.values)
      end

      post '/entry/:id/unstar' do |id|
        entry = entry_repository.unstar(id)
        respond(entry: entry.values)
      end

    private
      def entry_repository
        EntryRepository.new(current_user)
      end

      def all_as_values(entries)
        entries.map do |entry|
          entry.values.merge(feed_title: entry.feed.title)
        end
      end

    end
  end
end
