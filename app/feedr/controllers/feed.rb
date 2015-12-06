module Feedr
  class App < Sinatra::Base

    post '/feed' do
      Feed.create(url: params[:url])

      redirect to('/')
    end

  end
end
