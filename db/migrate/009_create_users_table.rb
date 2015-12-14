Sequel.migration do
  change do
    not_null                 = { null: false }
    unique_not_null          = { unique: true }.merge(not_null)
    unique_not_null_index    = { index: unique_not_null}

    create_table(:users) do
      String :login,    unique_not_null_index
      String :password, unique_not_null

      DateTime :created_at, not_null
      DateTime :updated_at, not_null
    end

  end
end
