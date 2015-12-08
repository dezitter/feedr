require 'sass'

module Feedr
  module Services
    class Sass

      def initialize(output_directory)
        @output_directory = output_directory
      end

      def compile(input_filenames)
        make_output_directory()

        input_filenames.each do |input_filename|
          compile_one(input_filename)
        end
      end

      def compile_one(input_filename)
        output_filename = output_filename_for(input_filename)

        File.open(output_filename, 'w') do |f|
          f << engine_for_file(input_filename).render
        end
      end

    private
      def make_output_directory
        FileUtils.mkdir_p(@output_directory) unless File.directory?(@output_directory)
      end

      def stylesheet_name_for(input_filename)
        File.basename(input_filename, File.extname(input_filename))
      end

      def output_filename_for(input_filename)
        "#{File.join(@output_directory, stylesheet_name_for(input_filename))}.css"
      end

      def sass_options
        {
          :style => :expanded,
          :syntax => :scss,
          :cache => false
        }
      end

      def engine_for_file(filename)
        ::Sass::Engine.for_file(filename, sass_options)
      end

    end
  end
end
