namespace :css do
  desc 'build the dist css directory'
  task :build => [:clean, :symlink_assets, :compile]
end
