module Feedr
  class EntryRepository

    def self.find(id)
      Entry[id].to_hash
    end

    def self.list
      feed_map = FeedRepository.to_hash
      published_order = Sequel.desc(:published)

      Entry.order(published_order).all.map do |entry|
        feed = feed_map[entry.feed_id]

        entry.to_hash.merge(feed_title: feed.title)
      end
    end

  end
end
