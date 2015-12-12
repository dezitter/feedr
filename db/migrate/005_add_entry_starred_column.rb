Sequel.migration do
  change do

    alter_table(:entries) do
      add_column :starred, TrueClass, :default => false
    end

  end
end
