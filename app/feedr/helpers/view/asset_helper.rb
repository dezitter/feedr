require 'uri'

module Feedr
  module ViewHelpers
    class AssetHelper

      def initialize(app)
        @app = app
      end

      def css_tag(href)
        "<link rel='stylesheet' href='#{versionize(href)}'>"
      end

      def js_tag(src)
        "<script type='text/javascript' src='#{versionize(src)}'></script>"
      end

    private
      def versionize(url)
        return set_version_param(url) if is_link_internal?(url)
        return url
      end

      def set_version_param(url)
        uri = URI.parse(url)
        query_values = URI.decode_www_form(uri.query || '') << [:v, version]

        uri.query = URI.encode_www_form(query_values)
        uri.to_s
      end

      def version
        v = @app.config['version']

        return "#{v}_#{Time.now.to_i}" if is_development_environment?
        return v
      end

      def is_link_internal?(url)
        return !url.start_with?('http')
      end

      def is_development_environment?
        ENV['RACK_ENV'].nil? or ENV['RACK_ENV'] == 'development'
      end

    end
  end
end
