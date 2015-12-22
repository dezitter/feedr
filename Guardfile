clearing :on
notification :off

guard 'rack' do
  watch('config.ru')
  watch('Gemfile.lock')
  watch(%r{^(config|app)/.+\.(rb|yml)$})
end

guard 'livereload' do
  watch(%r{^dist/(js|css)/[^/]*\.(js|css)$})
  watch(%r{^app/feedr/templates/.*\.hbs$})
end

guard 'rake', :task => 'css:compile' do
  watch(%r{^app/feedr/public/scss/.*\.scss})
end
