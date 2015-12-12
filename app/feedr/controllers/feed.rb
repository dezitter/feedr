module Feedr
  class App < Sinatra::Base

    post '/feed' do
      FeedRepository.create(params[:url])

      redirect to('/feeds')
    end

    get '/feeds' do
      handlebars :feeds, :locals => {
        feeds: FeedRepository.list
      }
    end

    get '/feed/:id' do |id|
      feed = FeedRepository.find(id)

      handlebars :feed, :locals => feed
    end

  end
end
