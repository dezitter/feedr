require 'uri'

module Feedr
  class Feed < Sequel::Model
    one_to_many :entries
    many_to_many :users, { :join_table => :subscriptions }

    plugin :timestamps, :update_on_create => true

    def before_create
      self.title ||= URI(self.url).host
      super
    end

    def add_entries(entries)
      entries = entries.map do |entry|
        entry.merge({
          feed_id: self.id,
          created_at: DateTime.now
        })
      end

      self.entries_dataset.multi_insert(entries)
    end

    def as_values
      values
    end

  end
end
