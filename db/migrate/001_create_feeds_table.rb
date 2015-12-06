Sequel.migration do
  change do

    create_table(:feeds) do
      primary_key :id

      String :title
      String :url, {
        unique: true,
        null: false
      }
    end

  end
end
