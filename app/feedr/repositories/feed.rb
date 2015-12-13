module Feedr
  class FeedRepository

    def self.create(url)
      Feed.create(url: url)
    end

    def self.list
      created_at_order = Sequel.desc(:created_at)

      Feed.order(created_at_order).all.map(&:to_hash)
    end

    def self.find(id)
      feed = Feed[id]
      entries = feed.entries.map(&:to_hash)

      feed.to_hash.merge(entries: entries)
    end

    def self.to_hash()
      Feed.to_hash(:id)
    end

  end
end
