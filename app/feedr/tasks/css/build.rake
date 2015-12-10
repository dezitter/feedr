namespace :css do
  desc 'build the dist css directory'
  task :build => [:clean, :compile]
end
