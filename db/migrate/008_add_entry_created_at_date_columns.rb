Sequel.migration do
  change do

    alter_table(:entries) do
      add_column :created_at, DateTime
      set_column_not_null :created_at
    end

  end
end
