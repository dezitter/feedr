require 'uri'

module Feedr
  class Feed < Sequel::Model

    def before_create
      self.title ||= URI(self.url).host
      super
    end

  end
end
