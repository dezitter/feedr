module Feedr
  class App < Sinatra::Base

    get '/feed/:feed_id/entry/:entry_id' do |feed_id, entry_id|
      entry = EntryRepository.find(entry_id)

      mustache :entry, :locals => entry
    end

  end
end
