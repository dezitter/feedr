module Feedr
  module Views
    class Layout < Mustache

      def title
        @title || 'Feedr'
      end

      def menu_items
        [
          { name: 'Home',  route: '/' },
          { name: 'Feeds', route: '/feeds' }
        ]
      end

    end
  end
end
