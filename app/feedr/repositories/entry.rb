module Feedr
  class EntryRepository

    def self.find(id)
      Entry[id].to_hash
    end

    def self.star(id)
      Entry[id].update(starred: true).to_hash
    end

    def self.unstar(id)
      Entry[id].update(starred: false).to_hash
    end

    def self.list(options={})
      feed_map = FeedRepository.to_hash

      published_order = Sequel.desc(:published)
      query = Entry.order(published_order)
                   .where(options[:where])
                   .limit(options[:limit])

      query.all.map do |entry|
        feed = feed_map[entry.feed_id]

        entry.to_hash.merge(feed_title: feed.title)
      end
    end

    def self.starred
      return self.list(where: { starred: true })
    end

    def self.mark_all_as_read
      return {
        updated: Entry.where(read: false).update(read: true)
      }
    end

  end
end
