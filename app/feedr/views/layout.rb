require 'feedr/views/base'

module Feedr
  module Views
    class Layout < Base

      def menu_items
        [
          { name: 'Home',  route: '/' },
          { name: 'Feeds', route: '/feeds' }
        ]
      end

    end
  end
end
