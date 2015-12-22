namespace :js do
  desc 'watch js files and re-bundle on changes'
  task :watch => [:build] do
    output_directory = PATHS[:js][:output_directory]

    entry = PATHS[:js][:input_filename]
    outfile = File.join(output_directory, 'bundle.js')

    sh "./node_modules/.bin/watchify #{entry} -o #{outfile} -v"
  end
end
