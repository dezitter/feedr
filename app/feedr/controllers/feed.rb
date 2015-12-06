require 'feedr/commands/feed_adder'

module Feedr
  class App < Sinatra::Base

    post '/feed' do
      Commands::FeedAdder.new.add(params[:url])

      redirect to('/')
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
