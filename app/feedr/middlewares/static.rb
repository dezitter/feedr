module Feedr
  class App < Sinatra::Base

    use Rack::Static, {
      urls: ['/assets', '/css/vendor/'],
      root: File.join(settings.root, '/public')
    }

  end
end
