module Feedr
  class App < Sinatra::Base

    get '/feed/:feed_id/entry/:entry_id' do |feed_id, entry_id|
      entry = Entry[entry_id]
      content = Services::Extracter.new.extract(entry.url)
      locals = entry.values.merge(content: content)

      mustache :entry, :locals => locals
    end

  end
end
