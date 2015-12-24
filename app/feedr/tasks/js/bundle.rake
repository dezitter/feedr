require 'feedr/services/bundler'

namespace :js do
  desc 'bundle js assets'
  task :bundle => [:compile_templates] do
    options = {
      js_output_directory: PATHS[:js][:output_directory],
      js_entry_filename: PATHS[:js][:input_filename]
    }

    Feedr::Services::Bundler.new(options).bundle
  end
end
