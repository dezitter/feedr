module Feedr
  class EntryRepository

    def self.find(id)
      Entry[id].to_hash
    end

    def self.star(id)
      Entry[id].update(starred: true)
    end

    def self.unstar(id)
      Entry[id].update(starred: false)
    end

    def self.list(options={})
      feed_map = FeedRepository.to_hash

      published_order = Sequel.desc(:published)
      query = Entry.order(published_order).where(options[:where])

      query.all.map do |entry|
        feed = feed_map[entry.feed_id]

        entry.to_hash.merge(feed_title: feed.title)
      end
    end

  end
end
