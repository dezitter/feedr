require 'thread/pool'
require 'feedr/services/syncer/feed_syncer'

Thread::Pool.abort_on_exception = true

module Feedr
  module Services
    class FeedsSyncer

      def initialize(feeds, pool_size=5)
        @feeds = feeds
        @pool = Thread.pool(pool_size)
      end

      def sync_all
        threads = @feeds.map { |feed| process_one(feed) }
        @pool.shutdown
        threads.map(&:result)
      end

    private
      def process_one(feed)
        @pool.process do
          { feed: feed, new_entries: sync_one(feed) }
        end
      end

      def sync_one(feed)
        Feedr::Services::FeedSyncer.new(feed).sync
      end

    end
  end
end
