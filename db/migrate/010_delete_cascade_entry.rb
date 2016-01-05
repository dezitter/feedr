Sequel.migration do
  change do

    alter_table(:entries) do
      drop_foreign_key :feed_id
      add_foreign_key :feed_id, :feeds, { :on_delete => :cascade }
    end

  end
end

