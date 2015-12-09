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
        @feeds.each do |feed|
          @pool.process { sync_one(feed) }
        end

        @pool.shutdown
      end

    private
      def sync_one(feed)
        Feedr::Services::FeedSyncer.new(feed).sync
      end

    end
  end
end
