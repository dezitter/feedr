Sequel.migration do
  change do

    alter_table(:users) do
      add_primary_key :id
    end

  end
end
