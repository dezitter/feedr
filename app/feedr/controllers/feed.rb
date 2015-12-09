module Feedr
  class App < Sinatra::Base

    post '/feed' do
      FeedRepository.create(params[:url])

      redirect to('/feeds')
    end

    get '/feeds' do
      mustache :feeds, :locals => {
        feeds: FeedRepository.list
      }
    end

    get '/feed/:id' do |id|
      feed = FeedRepository.find(id)

      mustache :feed, :locals => feed
    end

  end
end
