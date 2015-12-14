module Feedr
  module Services
    class TableSeeder

      def initialize(dataset)
        @dataset = dataset
      end

      def seed(values)
        @dataset.multi_insert stamp_all(values)
      end

    private
      def timestamp_fields
        [:created_at, :updated_at] & @dataset.columns
      end

      def stamp_all(values)
        values.map { |value| stamp_one(value) }
      end

      def stamp_one(value)
        ts = DateTime.now
        ts_fields_values = timestamp_fields.map { |f| [f, ts] }

        value.merge( Hash[ts_fields_values] )
      end

    end
  end
end
