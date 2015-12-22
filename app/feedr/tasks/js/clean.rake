namespace :js do
  desc 'clean all dist js files'
  task :clean do
    options = { js_output_directory: PATHS[:js][:output_directory] }

    Feedr::Services::Bundler.new(options).clean
  end
end
