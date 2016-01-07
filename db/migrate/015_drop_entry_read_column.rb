Sequel.migration do

  up do
    drop_column :entries, :read
  end

  down do
    add_column :entries, :read, TrueClass, :default => false
  end

end
