module Feedr
  module Services
    class EntryParser

      def self.parse_all(raw_entries)
        raw_entries.map { |raw_entry| self.parse_one(raw_entry) }
      end

      def self.parse_one(raw_entry)
        {
          url: raw_entry.url,
          title: raw_entry.title,
          published: raw_entry.published
        }
      end

    end
  end
end
