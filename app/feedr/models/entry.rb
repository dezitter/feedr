module Feedr
  class Entry < Sequel::Model
    many_to_one :feed
    many_to_many :users, { :join_table => :entries_states }

    def as_values
      values.merge(feed_title: feed.title)
    end
  end
end
