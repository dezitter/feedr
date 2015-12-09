require 'feedr/services/database'

Feedr::Services::Database.new(DB_CONFIG).connect

require 'feedr/models/feed'
require 'feedr/models/entry'
require 'feedr/services/syncer/feeds_syncer'

namespace :feed do
  desc "sync all feeds"
  task :sync do
    feeds = Feedr::Feed.all
    Feedr::Services::FeedsSyncer.new(feeds).sync_all
  end
end
