$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'yaml'
DB_CONFIG = YAML.load_file('./config/database.yml')

load './lib/feedr/tasks/db/migrate.rake'
load './lib/feedr/tasks/db/seed.rake'
load './lib/feedr/tasks/db/drop.rake'
