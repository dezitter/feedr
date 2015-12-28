module Feedr
  module ViewHelpers

    def render_if_authenticated(app, this, context, options)
      if app.is_authenticated?
        context.fn(this)
      end
    end

    def is_route_active(app, this, context, options)
      context.fn(this) if context[:hash].url == app.request.path
    end

  end
end
