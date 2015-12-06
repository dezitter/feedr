module Feedr
  class App < Sinatra::Base

    get '/feed/:feed_id/entry/:entry_id' do |feed_id, entry_id|
      entry = Entry[entry_id]

      mustache :entry, :locals => entry.values
    end

  end
end
