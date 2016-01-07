$LOAD_PATH.unshift File.expand_path('../app', __FILE__)

require 'yaml'

DB_CONFIG = YAML.load_file('./config/database.yml')
PATHS = {
  :css => {
    input_filenames:  [File.expand_path('./app/feedr/public/scss/main.scss')],
    output_directory: File.expand_path('./dist/css'),
    vendor_directory: File.expand_path('./vendor/css')
  },

  :js => {
    input_filename:  File.expand_path('./app/feedr/public/js/main.js'),
    output_directory: File.expand_path('./dist/js'),

    template_bundle_filename: File.expand_path('./app/feedr/public/js/templates.js'),
    template_source_directory: File.expand_path('./app/feedr/templates')
  }
}

load 'app/feedr/tasks/build.rake'

load 'app/feedr/tasks/db/drop.rake'
load 'app/feedr/tasks/db/dump.rake'
load 'app/feedr/tasks/db/migrate.rake'
load 'app/feedr/tasks/db/seed.rake'

load 'app/feedr/tasks/css/clean.rake'
load 'app/feedr/tasks/css/compile.rake'
load 'app/feedr/tasks/css/build.rake'

load 'app/feedr/tasks/js/clean.rake'
load 'app/feedr/tasks/js/compile_templates.rake'
load 'app/feedr/tasks/js/bundle.rake'
load 'app/feedr/tasks/js/build.rake'
load 'app/feedr/tasks/js/watch.rake'

load 'app/feedr/tasks/feed/sync.rake'
