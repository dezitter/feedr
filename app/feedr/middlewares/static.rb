module Feedr
  class App < Sinatra::Base

    use Rack::Static, {
      urls: ['/assets'],
      root: File.join(settings.root, '/public')
    }

  end
end
