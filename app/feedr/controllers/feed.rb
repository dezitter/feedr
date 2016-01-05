require_relative'./base'

module Feedr
  module Controller
    class Feed < Base

      get '/feeds' do
        handlebars :'pages/feeds', :locals => data.merge(title: 'Feeds')
      end

      get '/feed/:id' do |id|
        feed_title = data[:feed][:title]
        handlebars :'pages/feed', :locals => data.merge(title: "Feed - #{feed_title}")
      end

      post '/feed' do
        redirect back
      end

      post '/feed/:id/delete' do
        redirect back
      end

    end
  end
end
