module Feedr
  module Helpers

    def data
      request.env['feedr.data']
    end

    def set_data(value)
      request.env['feedr.data'] = value
    end

  end
end
