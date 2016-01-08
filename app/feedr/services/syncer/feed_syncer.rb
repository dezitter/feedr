require 'feedr/services/fetcher/feed_fetcher'

module Feedr
  module Services
    class FeedSyncer

      def initialize(feed)
        @feed = feed
      end

      def sync
        raw_feed = FeedFetcher.new(@feed).fetch
        raw_entries = raw_feed[:entries]
        new_entries = select_new_entries(raw_entries)

        @feed.add_entries(new_entries)
        new_entries
      end

    private
      def select_new_entries(raw_entries)
        known_urls = @feed.entries.map(&:url)

        raw_entries.reject do |raw_entry|
          known_urls.include?(raw_entry[:url])
        end
      end

    end
  end
end
