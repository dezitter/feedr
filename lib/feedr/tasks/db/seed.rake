require 'json'
require 'feedr/services/database'

namespace :db do

  desc 'insert some initial records into the database'
  task :seed do
    seed_files = ['feeds', 'entries'].map { |f| "./db/seed/#{f}.json"}
    data = seed_files.map do |file_name|
      {
        table_name: File.basename(file_name, '.json'),
        values: JSON.parse(File.read(file_name))
      }
    end

    Feedr::Services::Database.new(DB_CONFIG).seed(data)
  end
end
