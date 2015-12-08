require 'feedr/services/database'

namespace :db do

  desc 'migrate the database up to [version=latest]'
  task :migrate, [:version] do |t, args|
    version = args[:version].to_i if args[:version]

    Feedr::Services::Database.new(DB_CONFIG).migrate('./db/migrate', target: version)
  end
end
