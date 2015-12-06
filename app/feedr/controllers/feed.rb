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

  end
end
