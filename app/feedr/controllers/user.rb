require_relative'./base'

module Feedr
  module Controller
    class User < Base

      get '/login' do
        redirect to('/') if is_authenticated?
        handlebars :'pages/login', :locals => { title: 'Login' }
      end

      post '/login' do
        halt 400, "Invalid login or password" unless is_user_params_valid?

        user = user_repository.authenticate(*user_params)

        if user
          init_session(user.login)
          redirect to('/')
        else
          raise "Bad login/password combination."
        end
      end

      get '/signup' do
        redirect to('/') if is_authenticated?
        handlebars :'pages/signup', :locals => { title: 'Signup' }
      end

      post '/signup' do
        halt 400, "Invalid login or password" unless is_user_params_valid?
        halt 400, "Password mismatch" unless is_password_match?

        user = user_repository.create(*user_params)
        init_session(user.login)
        redirect to('/')
      end

      get '/logout' do
        clear_session
        redirect to('/login')
      end

    private
      def user_repository
        UserRepository.new
      end

    end
  end
end
