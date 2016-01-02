require_relative'./base'

module Feedr
  module Controller
    class Home < Base

      get '/' do
        handlebars :home, :locals => {
          title: 'Home',
          entries: EntryRepository.list(limit: 10)
        }
      end

    end
  end
end
