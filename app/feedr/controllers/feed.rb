module Feedr
  class App < Sinatra::Base

    post '/feed' do
      Feed.create(url: params[:url])

      redirect to('/feeds')
    end

    get '/feeds' do
      @title = 'Feeds'

      mustache :feeds, :locals => {
        :feeds => Feed.all.map { |e| e.values }
      }
    end

    get '/feed/:id' do |id|
      feed = Feed[id]
      entries = Entry.where(feed_id: id).map { |e| e.values }

      locals = feed.values.merge(entries: entries)
      mustache :feed, :locals => locals
    end

  end
end
