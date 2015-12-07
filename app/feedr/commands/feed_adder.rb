module Feedr
  module Commands
    class FeedAdder

      def add(url)
        raw_feed = Services::Fetcher.new.fetch(url)
        feed = Feed.create({
          url: url,
          title: raw_feed[:title]
        })

        feed.add_entries(raw_feed[:entries])
      end

    end
  end
end
