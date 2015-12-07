clearing :on
notification :off

guard 'rack' do
  watch('Gemfile.lock')
  watch(%r{^(config|lib|app)/.+\.rb$})
end

guard 'livereload' do
  watch(%r{^app/feedr/(public|templates)/.*})
end
