module Feedr
  class App < Sinatra::Base

    get '/api/feeds' do
      json({ feeds: FeedRepository.list() })
    end

    get '/api/feed/:id' do |id|
      json({ feed: FeedRepository.find(id) })
    end

  end
end
