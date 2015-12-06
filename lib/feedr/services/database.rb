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
        db.from(table).multi_insert(hashes)
      end

    end
  end
end
