require 'feedr/services/sass'

namespace :css do
  desc 'compile the sass files'
  task :compile  do
    output_directory = PATHS[:css][:output_directory]
    input_filenames = PATHS[:css][:input_filenames]

    Feedr::Services::Sass.new(output_directory).compile(input_filenames)
  end
end
