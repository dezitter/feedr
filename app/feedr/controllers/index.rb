module Feedr
  class App < Sinatra::Base

    get '/' do
      @title = 'Home'

      feed_map = Feed.to_hash(:id, :title)
      entries = Entry.order(Sequel.desc(:published)).all.map do |e|
        feed_title = feed_map[e.feed_id]
        e.values.merge(feed_title: feed_title)
      end

      mustache :index, :locals => {
        entries: entries
      }
    end

  end
end
