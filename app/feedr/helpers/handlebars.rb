require 'feedr/engine/handlebars'

module Feedr
  module Helpers

    def engine_options
      {
        helpers: ::Feedr::ViewHelpers,
        template_root: settings.handlebars[:templates],
      }
    end

    def handlebars(template, options={}, locals={})
      HandlebarsEngine.new(self, engine_options).render(template, options, locals)
    end

  end
end
