require_relative'./base'

module Feedr
  module Controller
    class Entry < Base

      get '/' do
        handlebars :'pages/home', :locals => data.merge(title: 'Home')
      end

      get '/entries/all' do
        handlebars :entries, :locals => data.merge(title: 'All')
      end

      get '/entries/starred' do
        handlebars :entries, :locals => data.merge(title: 'Starred')
      end

      get '/entries/archive' do
        handlebars :archive, :locals => data.merge(title: 'Archive')
      end

      post '/entries/mark-as-read' do
        redirect back
      end

      post '/entry/:id/star' do |id|
        redirect back
      end

      post '/entry/:id/unstar' do |id|
        redirect back
      end

    end
  end
end
