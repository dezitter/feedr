require 'feedr/services/parser/entry_parser'

module Feedr
  module Services
    class FeedParser

      def self.parse(raw_feed)
        {
          url: raw_feed.url,
          title: raw_feed.title,
          entries: EntryParser.parse_all(raw_feed.entries)
        }
      end

    end
  end
end
