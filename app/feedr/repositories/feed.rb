module Feedr
  class FeedRepository

    def self.create(url)
      Feed.create(url: url).to_hash
    end

    def self.list
      created_at_order = Sequel.desc(:created_at)

      Feed.order(created_at_order).all.map(&:to_hash)
    end

    def self.find(id)
      feed = Feed[id]
      entries = feed.entries.map do |entry|
        entry.to_hash.merge(feed_title: feed.title)
      end

      feed.to_hash.merge(entries: entries)
    end

    def self.to_hash()
      Feed.to_hash(:id)
    end

  end
end
