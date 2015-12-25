module Feedr
  class App < Sinatra::Base

    post '/feed' do
      FeedRepository.create(*feed_params)

      redirect to('/feeds')
    end

    get '/feeds' do
      handlebars :feeds, :locals => {
        title: 'Feeds',
        feeds: FeedRepository.list()
      }
    end

    get '/feed/:id' do |id|
      feed = FeedRepository.find(id)

      handlebars :feed, :locals => {
        title: "Feed - #{feed[:title]}",
        feed: feed
      }
    end

  end
end
