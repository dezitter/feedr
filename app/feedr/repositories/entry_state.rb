module Feedr
  class EntryStateRepository

    def initialize(user)
      @user = user
    end

    def insert_many(states)
      EntryState.dataset.multi_insert(states)
    end

    def star(entry_id)
      state = find_or_create(entry_id)
      state.update(starred: true)
    end

    def unstar(entry_id)
      state = find_or_create(entry_id)
      state.update(starred: false)
    end

    def list(options={})
      EntryState.where(:user_id => @user.id).all
    end

    def mark_as_read(entry_ids)
      existing_ids = self.list.map { |state| state.entry_id }
      new_ids = entry_ids - existing_ids

      new_states_values = new_ids.map { |id| new_state_value(id, read: true) }

      insert_many(new_states_values)
      updated_count = EntryState.where(entry_id: existing_ids).update(read: true)

      new_ids.size + updated_count
    end

    def states_hash(key=:entry_id)
      EntryState.where(:user_id => @user.id)
                .to_hash(key)
    end

  private
    def find_or_create(entry_id)
      value = new_state_value(entry_id)
      EntryState.find_or_create(value)
    end

    def new_state_value(entry_id, state={})
      state.merge(entry_id: entry_id, user_id: @user.id)
    end

  end
end
