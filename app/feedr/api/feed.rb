require_relative './base'

module Feedr
  module Api
    class Feed < Base

      get '/feeds' do
        respond(feeds: FeedRepository.list())
      end

      get '/feed/:id' do |id|
        respond(feed: FeedRepository.find(id))
      end

      post '/feed' do
        respond(feed: FeedRepository.create(*feed_params))
      end

      post '/feed/:id/delete' do |id|
        respond(feed: FeedRepository.delete(id))
      end

    end
  end
end
