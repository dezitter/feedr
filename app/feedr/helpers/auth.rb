module Feedr
  module Helpers

    def is_logging?
      request.path == '/login'
    end

    def is_signing_up?
      request.path == '/signup'
    end

    def session_user_key
      ENV['SESSION_USER_KEY']
    end

    def is_authenticated?
      not session[session_user_key].nil?
    end

    def is_route_restricted?
      not is_logging? and not is_signing_up?
    end

    def init_session(login)
      session[session_user_key] = login
    end

    def clear_session
      session[session_user_key] = nil
    end

    def current_user
      login = session[session_user_key]
      return UserRepository.find(login) unless login.nil?
    end

  end
end
