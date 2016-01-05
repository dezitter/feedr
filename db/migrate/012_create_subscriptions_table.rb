Sequel.migration do
  change do

    create_table(:subscriptions) do
      foreign_key :feed_id, :feeds, { :on_delete => :cascade }
      foreign_key :user_id, :users, { :on_delete => :cascade }

      primary_key [:feed_id, :user_id], :name => :subscription_id
    end

  end
end
