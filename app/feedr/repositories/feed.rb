module Feedr
  class FeedRepository
    @@CREATED_AT_ORDER = Sequel.desc(:created_at)

    def self.find(id)
      Feed[id]
    end

    def self.create(params)
      Feed.create(params)
    end

    def self.delete(id, user)
      feed = self.find(id)
      user.remove_feed(feed)
    end

    def self.list(options={})
      Feed.order(@@CREATED_AT_ORDER)
          .where(options[:where])
          .all
    end

  end
end
