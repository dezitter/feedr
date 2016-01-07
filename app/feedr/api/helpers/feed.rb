module Feedr
  module Api
    module Helpers

      def as_feed_values(feed)
        entries = all_as_stateful_values(feed.entries)
        as_values(feed, entries: entries)
      end

    end
  end
end
