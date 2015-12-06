namespace :db do

  desc 'migrate the database to the last version'
  task :migrate do
    require 'yaml'
    require 'sequel'

    Sequel.extension(:migration)
    db = Sequel.connect(YAML.load_file('./config/database.yml'))

    Sequel::Migrator.run(db, './db/migrate')
  end
end
