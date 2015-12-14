module Feedr
  module Helpers

    def is_logging?
      request.path == '/login'
    end

    def is_signing_up?
      request.path == '/signup'
    end

    def is_authenticated?
      not session[ENV['SESSION_USER_KEY']].nil?
    end

    def is_route_restricted?
      not is_logging? and not is_signing_up?
    end

    def init_session(login)
      session[ENV['SESSION_USER_KEY']] = login
    end

    def clear_session
      session[ENV['SESSION_USER_KEY']] = nil
    end

  end
end
