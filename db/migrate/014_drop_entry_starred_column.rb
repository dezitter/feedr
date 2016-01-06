Sequel.migration do

  up do
    drop_column :entries, :starred
  end

  down do
    add_column :entries, :starred, TrueClass, :default => false
  end

end
