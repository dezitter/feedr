require 'yaml'

Sequel.connect(YAML.load_file('./config/database.yml'))

require 'feedr/helpers/accept'
require 'feedr/helpers/auth'
require 'feedr/helpers/data'
require 'feedr/helpers/handlebars'
require 'feedr/helpers/params'
require 'feedr/helpers/repository'
require 'feedr/helpers/view/init'

require 'feedr/models/user'
require 'feedr/models/feed'
require 'feedr/models/entry'
require 'feedr/models/entry_state'

require 'feedr/repositories/user'
require 'feedr/repositories/feed'
require 'feedr/repositories/entry'
require 'feedr/repositories/entry_state'

require 'feedr/api/entry'
require 'feedr/api/feed'

require 'feedr/controllers/entry'
require 'feedr/controllers/feed'
require 'feedr/controllers/user'

require 'feedr/services/syncer/feeds_syncer'

module Feedr
  class App < Sinatra::Base
    set :root, File.join(File.dirname(__FILE__), 'feedr')
    set :dist, File.join(settings.root, '..', '..', 'dist')
    set :cache_control, "public, max-age=#{60 * 60 * 24 * 7 * 4}"

    use Rack::PostBodyContentTypeParser
    use Rack::Session::Cookie, secret: ENV['SESSION_SECRET']

    use Rack::Deflater
    use Rack::Static, {
      urls: ['/assets'],
      root: File.join(settings.root, '/public'),
      header_rules: [[:all, { 'Cache-Control' => settings.cache_control }]]
    }
    use Rack::Static, {
      urls: ['/css', '/js'],
      root: settings.dist,
      header_rules: [[:all, { 'Cache-Control' => settings.cache_control }]]
    }

    use Api::Entry
    use Api::Feed

    use Controller::Entry
    use Controller::Feed
    use Controller::User
  end
end
