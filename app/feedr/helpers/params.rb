module Feedr
  module Helpers

    def user_params
      return params[:login], params[:password]
    end

    def is_user_params_valid?
      login, password = user_params

      return false if login.empty? or password.empty?
      return true
    end

    def is_password_match?
      params[:password] == params[:password_confirm]
    end

  end
end
