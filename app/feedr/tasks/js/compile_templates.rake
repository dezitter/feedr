require 'feedr/services/template_compiler'

namespace :js do
  desc 'bundle templates'
  task :compile_templates do
    options = {
      js_entry_filename: PATHS[:js][:input_filename],
      template_bundle_filename: PATHS[:js][:template_bundle_filename],
      template_source_directory: PATHS[:js][:template_source_directory]
    }

    Feedr::Services::TemplateCompiler.new(options).compile
  end
end
