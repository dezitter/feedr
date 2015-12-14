require 'sequel'

module Feedr
  module Services
    class Database

      def initialize(configuration)
        @configuration = configuration
      end

      def connect(&block)
        Sequel.connect(@configuration, &block)
      end

      def migrate(directory, options)
        Sequel.extension(:migration)

        connect do |db|
          Sequel::Migrator.run(db, directory, options)
        end
      end

      def seed(seeds)
        connect do |db|
          seeds.each { |s| seed_table(db, s[:table_name], s[:values]) }
        end
      end

      def drop
        filename = @configuration['database']
        FileUtils.rm(filename) if File.exist?(filename)
      end

    private
      def seed_table(db, table, hashes)
        timestamp_fields = get_timestamp_fields(db, table)
        hashes = hashes.map { |h| stamp_hash(h, timestamp_fields) }

        db.from(table).multi_insert(hashes)
      end

      def get_timestamp_fields(db, table)
        [:created_at, :updated_at] & db.from(table).columns
      end

      def stamp_hash(hash, timestamp_fields)
        ts = DateTime.now
        field_value_pairs = timestamp_fields.map { |f| [f, ts] }

        hash.merge( Hash[field_value_pairs] )
      end

    end
  end
end
