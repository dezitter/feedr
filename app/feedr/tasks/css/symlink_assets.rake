require 'pathname'

namespace :css do
  desc 'symlink external assets to dist directory'
  task :symlink_assets do
    src = PATHS[:css][:vendor_directory]
    dist = PATHS[:css][:output_directory]

    FileUtils.mkdir_p(dist) unless File.directory?(dist)

    FileUtils.ln_s(src, File.join(dist, 'vendor'))
  end
end
