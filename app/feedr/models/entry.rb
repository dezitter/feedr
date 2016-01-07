module Feedr
  class Entry < Sequel::Model
    many_to_one :feed
    many_to_many :users, { :join_table => :entries_states }
  end
end
