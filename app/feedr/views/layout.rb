module Feedr
  module Views
    class Layout < Mustache

      def title
        @title || 'Feedr'
      end

      def menu_items
        [
          { name: 'Feeds', route: '/feeds' }
        ]
      end

    end
  end
end
