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
        respond(feed: as_feed_values(feed))
      end

      post '/feed' do
        feed = feed_repository.add(feed_params)
        respond(feed: as_values(feed))
      end

      post '/feed/:id/delete' do |id|
        feed = feed_repository.remove(id)
        respond(feed: as_values(feed))
      end

      post '/feed/refresh' do
        fetch_results = feed_repository.refresh.map do |result|
          {
            feed: as_values(result[:feed]),
            count: result[:new_entries].size
          }
        end

        respond(fetch_results: fetch_results)
      end

    end
  end
end
