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
        sh "#{browserify_cmd} #{@entry} -g #{global_transform} -o #{outfile}"
      end

      def clean
        FileUtils.rm_rf(@js_output_directory)
      end

      def watch
        sh "#{watchify_cmd} #{@entry} -g #{global_transform} -o #{outfile} -v"
      end

    private
      def browserify_cmd
        "#{node_bin}/browserify"
      end

      def watchify_cmd
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

    end
  end
end
