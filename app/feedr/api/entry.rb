require_relative './base'

module Feedr
  module Api
    class Entry < Base

      get '/' do
        entries = EntryRepository.unread(limit: 10)
        respond(entries: all_as_values(entries))
      end

      get '/entries/all' do
        entries = EntryRepository.unread(limit: params[:limit])
        respond(entries: all_as_values(entries))
      end

      get '/entries/starred' do
        entries = EntryRepository.starred
        respond(entries: all_as_values(entries))
      end

      get '/entries/archive' do
        entries = EntryRepository.read
        respond(entries: all_as_values(entries))
      end

      post '/entries/mark-as-read' do
        updated = EntryRepository.mark_all_as_read
        respond(updated: updated)
      end

      post '/entry/:id/star' do |id|
        entry = EntryRepository.star(id)
        respond(entry: entry.values)
      end

      post '/entry/:id/unstar' do |id|
        entry = EntryRepository.unstar(id)
        respond(entry: entry.values)
      end

    private
      def all_as_values(entries)
        entries.map do |entry|
          entry.values.merge(feed_title: entry.feed.title)
        end
      end

    end
  end
end
