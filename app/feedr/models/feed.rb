require 'uri'

module Feedr
  class Feed < Sequel::Model
    one_to_many :entries

    def before_create
      self.title ||= URI(self.url).host
      super
    end

  end
end
