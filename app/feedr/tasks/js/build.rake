namespace :js do
  desc 'build the dist js directory'
  task :build => [:clean, :bundle]
end
