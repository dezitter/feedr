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

    end
  end
end
