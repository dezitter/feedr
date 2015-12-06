namespace :db do

  desc 'migrate the database up to [version=latest]'
  task :migrate, [:version] do |t, args|
    require 'yaml'
    require 'sequel'

    Sequel.extension(:migration)
    db = Sequel.connect(YAML.load_file('./config/database.yml'))
    version = args[:version].to_i if args[:version]

    Sequel::Migrator.run(db, './db/migrate', target: version)
  end
end
