module Feedr
  class Entry < Sequel::Model
    many_to_one :feed
  end
end
