Sequel.migration do
  change do

    alter_table(:entries) do
      add_column :read, TrueClass, :default => false
    end

  end
end
