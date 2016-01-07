module Feedr
  module Api
    module Helpers

      def as_values(model, hash={})
        model.as_values.merge(hash)
      end

    end
  end
end
