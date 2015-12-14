require 'sequel'
require 'feedr/services/database/table_seeder'

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
          seeds.each do |s|
            dataset = db.from(s[:table])
            TableSeeder.new(dataset).seed(s[:values])
          end
        end
      end

      def drop
        filename = @configuration['database']
        FileUtils.rm(filename) if File.exist?(filename)
      end

    end
  end
end
