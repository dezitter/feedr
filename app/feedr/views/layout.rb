require 'feedr/views/base'

module Feedr
  module Views
    class Layout < Base

      def menu_items
        [
          { name: 'Feeds', route: '/feeds' }
        ]
      end

    end
  end
end
