Sequel.migration do

  up do
    drop_column :entries, :url
    add_column :entries, :url, String
  end

  down do
    unique_not_null = { unique: true, null: false }

    drop_column :entries, :url
    add_column :entries, :url, String, unique_not_null
  end

end
