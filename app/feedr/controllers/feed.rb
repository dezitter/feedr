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

  end
end
