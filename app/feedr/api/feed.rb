require_relative './base'

module Feedr
  module Api
    class Feed < Base

      get '/feeds' do
        feeds = feed_repository.list
        respond(feeds: all_as_values(feeds))
      end

      get '/feed/:id' do |id|
        feed = feed_repository.find(id)
        respond(feed: as_values(feed))
      end

      post '/feed' do
        feed = feed_repository.add(feed_params)
        respond(feed: feed.values)
      end

      post '/feed/:id/delete' do |id|
        feed = feed_repository.remove(id)
        respond(feed: feed.values)
      end

    private
      def as_values(feed)
        entries = feed.entries.map do |entry|
          entry.as_values
        end

        feed.values.merge(entries: entries)
      end

      def all_as_values(feeds)
        feeds.map(&:values)
      end

    end
  end
end
