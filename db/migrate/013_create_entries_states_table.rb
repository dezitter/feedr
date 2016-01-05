Sequel.migration do
  change do

    create_table(:entries_states) do
      foreign_key :entry_id, :entries, { :on_delete => :cascade }
      foreign_key :user_id, :users, { :on_delete => :cascade }

      TrueClass :starred, :default => false
      TrueClass :read,    :default => false

      primary_key [:entry_id, :user_id], :name => :entry_state
    end

  end
end
