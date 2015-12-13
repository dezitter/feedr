Sequel.migration do
  change do

    alter_table(:feeds) do
      add_column :created_at, DateTime
      add_column :updated_at, DateTime

      set_column_not_null :created_at
      set_column_not_null :updated_at
    end

  end
end
