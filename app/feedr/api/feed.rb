require_relative './base'

module Feedr
  module Api
    class Feed < Base

      get '/feeds' do
        feeds = FeedRepository.list
        respond(feeds: all_as_values(feeds))
      end

      get '/feed/:id' do |id|
        feed = FeedRepository.find(id)
        respond(feed: as_values(feed))
      end

      post '/feed' do
        feed = FeedRepository.create(feed_params)
        respond(feed: feed.values)
      end

      post '/feed/:id/delete' do |id|
        feed = FeedRepository.delete(id)
        respond(feed: feed.values)
      end

    private
      def as_values(feed)
        entries = feed.entries.map do |entry|
          entry.values.merge(feed_title: feed.title)
        end

        feed.values.merge(entries: entries)
      end

      def all_as_values(feeds)
        feeds.map(&:values)
      end

    end
  end
end
