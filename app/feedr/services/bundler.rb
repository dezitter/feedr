module Feedr
  module Services
    class Bundler
      include Rake::DSL

      def initialize(options)
        @entry = options[:js_entry_filename]
        @js_output_directory = options[:js_output_directory]
      end

      def bundle
        make_js_dist_dir()
        sh browserify_cmd
      end

      def clean
        FileUtils.rm_rf(@js_output_directory)
      end

      def watch
        sh watchify_cmd
      end

    private
      def browserify_cmd
        [
          "#{browserify_bin} #{@entry}",
          "-o #{outfile}",
          ("-g #{global_transform}" if not is_development_environment),
          ("-d" if is_development_environment)
        ].reject(&:nil?).join(' ')
      end

      def browserify_bin
        "#{node_bin}/browserify"
      end

      def watchify_cmd
        [
          "#{watchify_bin} #{@entry}",
          "-o #{outfile}",
          ("-g #{global_transform}" if not is_development_environment),
          ("-d" if is_development_environment),
          "-v"
        ].reject(&:nil?).join(' ')
      end

      def watchify_bin
        "#{node_bin}/watchify"
      end

      def node_bin
        "./node_modules/.bin"
      end

      def outfile
        File.join(@js_output_directory, 'bundle.js')
      end

      def global_transform
        "uglifyify"
      end

      def make_js_dist_dir
        FileUtils.mkdir_p(@js_output_directory) unless File.directory?(@js_output_directory)
      end

      def is_development_environment
        ENV['RACK_ENV'].nil? or ENV['RACK_ENV'] == 'development'
      end

    end
  end
end
