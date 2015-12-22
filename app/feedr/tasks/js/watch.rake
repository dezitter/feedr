namespace :js do
  desc 'watch js files and re-bundle on changes'
  task :watch => [:build] do
    options = {
      js_output_directory: PATHS[:js][:output_directory],
      js_entry_filename: PATHS[:js][:input_filename]
    }

    Feedr::Services::Bundler.new(options).watch
  end
end
