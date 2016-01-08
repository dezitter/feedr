module Feedr
  class FeedRepository
    @@CREATED_AT_ORDER = Sequel.desc(:created_at)

    def initialize(user)
      @user = user
    end

    def find(id)
      Feed.first(:id => id, :users => @user)
    end

    def add(params)
      feed = Feed.find_or_create(params)
      @user.add_feed(feed)
    end

    def remove(id)
      feed = self.find(id)
      feed = @user.remove_feed(feed)

      feed.destroy if feed.users.empty?

      feed
    end

    def list(options={})
      where_options = (options[:where] || {}).merge(users: @user)

      Feed.order(@@CREATED_AT_ORDER)
          .where(where_options)
          .all
    end

    def refresh
      feeds = self.list
      Services::FeedsSyncer.new(feeds).sync_all
    end

  end
end
