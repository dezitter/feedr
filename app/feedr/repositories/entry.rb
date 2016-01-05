module Feedr
  class EntryRepository
    @@PUBLISHED_ORDER = Sequel.desc(:published)

    def initialize(user)
      @user = user
    end

    def find(id)
      Entry[id]
    end

    def star(id)
      self.find(id).update(starred: true)
    end

    def unstar(id)
      self.find(id).update(starred: false)
    end

    def list(options={})

      Entry.order(@@PUBLISHED_ORDER)
           .where(options[:where])
           .limit(options[:limit])
           .join(:subscriptions, {
             :feed_id => :feed_id,
             :user_id => @user.id
           })
           .all
    end

    def starred(options={})
      self.list options.merge(where: { starred: true })
    end

    def read(options={})
      self.list options.merge(where: { read: true })
    end

    def unread(options={})
      self.list options.merge(where: { read: false })
    end

    def mark_all_as_read
      Entry.where(read: false).update(read: true)
    end

  end
end
