require 'feedr/services/database/database'

namespace :db do

  desc 'drop the entire databse'
  task :drop do
    Feedr::Services::Database.new(DB_CONFIG).drop
  end
end
