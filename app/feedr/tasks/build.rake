desc 'build all necessary stuff to run the app'
task :build => [:'db:migrate', :'css:build', :'js:build']
