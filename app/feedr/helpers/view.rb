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

    def css(app, this, context, options)
      href = context[:hash].href
      "<link rel='stylesheet' href='#{href}'>"
    end

    def js(app, this, context, options)
      src = context[:hash].src
      "<script type='text/javascript' src='#{src}'></script>"
    end

  end
end
