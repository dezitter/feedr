namespace :css do
  desc 'clean all dist css files'
  task :clean do
    FileUtils.rm_rf(PATHS[:css][:output_directory])
  end
end
