require 'feedr/helpers/view'

module Feedr
  module Views
    class Base < Mustache
      include ViewHelpers

      def title
        @title || 'Feedr'
      end

    end
  end
end
