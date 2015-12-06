Sequel.migration do
  change do

    create_table(:entries) do
      primary_key :id

      String :title
      String :url, {
        unique: true,
        null: false
      }
    end

  end
end
