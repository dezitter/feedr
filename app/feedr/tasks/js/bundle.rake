namespace :js do
  desc 'bundle js assets'
  task :bundle do
    output_directory = PATHS[:js][:output_directory]

    entry = PATHS[:js][:input_filename]
    outfile = File.join(output_directory, 'bundle.js')

    FileUtils.mkdir_p(output_directory) unless File.directory?(output_directory)

    sh "./node_modules/.bin/browserify #{entry} -o #{outfile}"
  end
end
