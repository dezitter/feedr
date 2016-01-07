module Feedr
  class EntryRepository
    @@PUBLISHED_ORDER = Sequel.desc(:published)

    def initialize(user)
      @user = user
      @entry_state_repository = EntryStateRepository.new(user)
    end

    def star(id)
      @entry_state_repository.star(id)
    end

    def unstar(id)
      @entry_state_repository.unstar(id)
    end

    def list(options={})
      list_query(options)
        .join(:subscriptions, subscriptions_condition)
        .all
    end

    def starred(options={})
      list_query(options)
        .join(:entries_states, states_condition.merge(starred: true))
        .all
    end

    def read(options={})
      list_query(options)
        .join(:entries_states, states_condition.merge(read: true))
        .all
    end

    def unread(options={})
      read_ids = pluck(read, :id)

      list_query(options)
        .join(:subscriptions, subscriptions_condition)
        .where(not_in(:id, read_ids))
        .all
    end

    def mark_all_as_read
      entry_ids = pluck(self.list, :id)
      @entry_state_repository.mark_as_read(entry_ids)
    end

    def states_hash
      @entry_state_repository.states_hash
    end

  private
    def list_query(options={})
      Entry.order(@@PUBLISHED_ORDER)
           .where(options[:where])
           .limit(options[:limit])
    end

    def pluck(entries, key)
      entries.map { |entry| entry.send(key) }
    end

    def subscriptions_condition
      { feed_id: :feed_id, user_id: @user.id }
    end

    def states_condition
      { entry_id: :id, user_id: @user.id }
    end

    def not_in(key, values)
      Sequel.~(key => values)
    end

  end
end
