Sequel.migration do
  change do

    alter_table(:entries) do
      add_foreign_key :feed_id, :feeds
    end

  end
end
