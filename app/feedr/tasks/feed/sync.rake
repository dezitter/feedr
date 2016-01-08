require 'feedr/services/database/database'

Feedr::Services::Database.new(DB_CONFIG).connect

require 'feedr/models/feed'
require 'feedr/models/entry'
require 'feedr/services/syncer/feeds_syncer'

namespace :feed do
  desc "sync all feeds"
  task :sync do
    feeds = Feedr::Feed.all
    results = Feedr::Services::FeedsSyncer.new(feeds).sync_all

    results.each do |result|
      feed = result[:feed]
      new_entries = result[:new_entries]

      puts "#{feed.title}: #{new_entries.size} entries fetched."
    end
  end
end
