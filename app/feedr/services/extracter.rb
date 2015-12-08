require 'open-uri'
require 'readability'

module Feedr
  module Services
    class Extracter

      def extract(url)
        source = open(url).read
        Readability::Document.new(source).content
      end

    end
  end
end
