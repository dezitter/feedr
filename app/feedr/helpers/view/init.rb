require 'feedr/helpers/view/asset_helper'

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
      AssetHelper.new(app).css_tag(context[:hash].href)
    end

    def js(app, this, context, options)
      AssetHelper.new(app).js_tag(context[:hash].src)
    end

  end
end
