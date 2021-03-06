module Feedr
  class HandlebarsEngine

    def initialize(app, settings)
      @app = app
      @context = Handlebars::Context.new

      @template_root = settings[:template_root]
      @template_extension = settings[:template_extension] || 'hbs'

      @context.partial_missing do |tpl|
        partial_renderer(tpl)
      end

      register_helpers(settings[:helpers]) if settings[:helpers]
    end

    def render(template, options={}, locals={})
      data = (options[:locals] || {}).merge(locals)
      content = evaluate(template, data)

      return evaluate(:layout, {content: content}.merge(data))
    end

  private
    def evaluate(template, data)
      template_compiled = compile(template)
      return template_compiled.call(data)
    end

    def compile(template)
      template_source = source(template)
      return @context.compile(template_source)
    end

    def partial_renderer(template)
      lambda do |this, context, options|
        evaluate(template, options[:hash])
      end
    end

    def source(template)
      template_filename = filename(template)

      raise "Could not find template #{template}" unless File.exist? template_filename

      File.open(template_filename) do |f|
        return f.read
      end
    end

    def filename(template)
      File.join(@template_root, basename(template))
    end

    def basename(template)
      "#{template}.#{@template_extension}"
    end

    def register_helpers(helpers_module)
      helpers_module.instance_methods(false).each do |method|

        @context.register_helper(method) do |this, ctx, opts|
          Class.new.extend(helpers_module).send(method, @app, this, ctx, opts)
        end

      end
    end
  end
end
