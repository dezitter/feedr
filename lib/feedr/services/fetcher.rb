require 'feedjira'

module Feedr
  module Services
    class Fetcher

      def fetch(url)
        feed = Feedjira::Feed.fetch_and_parse(url)
        parse_feed(feed)
      end

    private
    def parse_feed(feed)
      entries = feed.entries.map { |entry| parse_entry(entry) }

      {
        title: feed.title,
        url: feed.url,
        entries: entries
      }
    end

    def parse_entry(entry)
      {
        title: entry.title,
        url: entry.url
      }
    end

    end
  end
end
