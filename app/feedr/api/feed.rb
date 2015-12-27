module Feedr
  class App < Sinatra::Base

    get '/api/feeds' do
      json({ feeds: FeedRepository.list() })
    end

    get '/api/feed/:id' do |id|
      json({ feed: FeedRepository.find(id) })
    end

    post '/api/feed' do
      json ({ feed: FeedRepository.create(*feed_params) })
    end

  end
end
