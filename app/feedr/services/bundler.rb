module Feedr
  module Services
    class Bundler
      include Rake::DSL

      def initialize(options)
        @js_entry_filename = options[:js_entry_filename]
        @js_output_directory = options[:js_output_directory]
      end

      def bundle
        make_js_dist_dir()
        sh "./node_modules/.bin/browserify #{@js_entry_filename} -o #{bundle_filename}"
      end

      def clean
        FileUtils.rm_rf(@js_output_directory)
      end

      def watch
        sh "./node_modules/.bin/watchify #{@js_entry_filename} -o #{bundle_filename} -v"
      end

    private
      def bundle_filename
        File.join(@js_output_directory, 'bundle.js')
      end

      def make_js_dist_dir
        FileUtils.mkdir_p(@js_output_directory) unless File.directory?(@js_output_directory)
      end

    end
  end
end
