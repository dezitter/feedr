module Feedr
  class EntryRepository
    @@PUBLISHED_ORDER = Sequel.desc(:published)

    def self.find(id)
      Entry[id]
    end

    def self.star(id)
      self.find(id).update(starred: true)
    end

    def self.unstar(id)
      self.find(id).update(starred: false)
    end

    def self.list(options={})
      Entry.order(@@PUBLISHED_ORDER)
           .where(options[:where])
           .limit(options[:limit])
           .all
    end

    def self.starred(options={})
      self.list options.merge(where: { starred: true })
    end

    def self.read(options={})
      self.list options.merge(where: { read: true })
    end

    def self.unread(options={})
      self.list options.merge(where: { read: false })
    end

    def self.mark_all_as_read
      Entry.where(read: false).update(read: true)
    end

  end
end
