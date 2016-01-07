require 'feedr/services/database/database'

namespace :db do

  desc 'dumps the current schema of the database'
  task :dump do
    puts Feedr::Services::Database.new(DB_CONFIG).dump
  end
end
