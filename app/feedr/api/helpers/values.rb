module Feedr
  module Api
    module Helpers

      def as_values(model, hash={})
        model.as_values.merge(hash)
      end

      def all_as_values(models)
        models.map do |model|
          hash = yield(model) if block_given?
          as_values(model, hash || {})
        end
      end

    end
  end
end
