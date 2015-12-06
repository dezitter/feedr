module Feedr
  module Views
    class Layout < Mustache

      def title
        @title || 'Feedr'
      end

    end
  end
end
