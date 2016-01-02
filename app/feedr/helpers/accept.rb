module Feedr
  module Helpers

    def accept_only?(type)
      request.accept.size == 1 and request.accept.first.to_s == type
    end

    def accept_json?
      accept_only?('application/json')
    end

  end
end
