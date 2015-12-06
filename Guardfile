clearing :on
notification :off

guard 'rack' do
  watch('Gemfile.lock')
  watch(%r{^(config|lib|app)/.*})
end
