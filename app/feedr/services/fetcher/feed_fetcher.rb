require 'feedjira'
require 'feedr/services/parser/feed_parser'

module Feedr
  module Services
    class FeedFetcher

      def initialize(feed)
        @feed = feed
      end

      def fetch
        raw_feed = Feedjira::Feed.fetch_and_parse(@feed.url)
        FeedParser.parse(raw_feed)
      end

    end
  end
end
