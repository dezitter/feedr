module Feedr
  module Services
    class TemplateCompiler

      def initialize(options)
        @js_source_directory = File.dirname(options[:js_entry_filename])
        @template_bundle_filename = options[:template_bundle_filename]
        @template_source_directory = options[:template_source_directory]
      end

      def compile
        clean_compiled_templates()

        File.open(@template_bundle_filename, 'w') do |file|
          file << header
          file << body
          file << footer
        end
      end

    private
      def clean_compiled_templates
        FileUtils.rm_f(@template_bundle_filename)
      end

      def header
        [
          "var fs = require('fs');\n\n",
          "var templates = {\n"
        ].join
      end

      def footer
        [
          "\n};\n",
          "module.exports = templates;\n"
        ].join
      end

      def body
        lines = Dir.glob(pattern).map do |filename|
          name = template_name(filename)
          filepath = template_filepath(filename)

          "'#{name}': fs.readFileSync(__dirname + '/#{filepath}', 'utf8')"
        end

        lines.join(",\n")
      end

      def pattern
        File.join(@template_source_directory, '**', '*.hbs')
      end

      def template_name(filename)
        ext = File.extname(filename)
        name = Pathname.new(filename).relative_path_from(template_root_directory).to_s

        name.slice(0, name.length - ext.length)
      end

      def template_root_directory
        Pathname.new(@template_source_directory)
      end

      def template_filepath(filename)
        Pathname.new(filename).relative_path_from Pathname.new(@js_source_directory)
      end

    end
  end
end
