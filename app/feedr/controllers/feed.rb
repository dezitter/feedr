module Feedr
  class App < Sinatra::Base

    post '/feed' do
      redirect to('/')
    end

  end
end
