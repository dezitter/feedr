$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'yaml'

DB_CONFIG = YAML.load_file('./config/database.yml')
PATHS = {
  :css => {
    input_filenames:  [File.expand_path('./app/feedr/public/scss/main.scss')],
    output_directory: File.expand_path('./dist/css'),
    vendor_directory: File.expand_path('./vendor/css')
  }
}

load './lib/feedr/tasks/build.rake'

load './lib/feedr/tasks/db/migrate.rake'
load './lib/feedr/tasks/db/seed.rake'
load './lib/feedr/tasks/db/drop.rake'

load './lib/feedr/tasks/css/build.rake'
load './lib/feedr/tasks/css/clean.rake'
load './lib/feedr/tasks/css/compile.rake'
load './lib/feedr/tasks/css/symlink_assets.rake'
