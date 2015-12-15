module Feedr
  module ViewHelpers

    def render_if_authenticated(app, context, block)
      if app.is_authenticated?
        block.fn(context)
      end
    end

  end
end
