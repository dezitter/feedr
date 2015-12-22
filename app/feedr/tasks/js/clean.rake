namespace :js do
  desc 'clean all dist js files'
  task :clean do
    FileUtils.rm_rf(PATHS[:js][:output_directory])
  end
end

