module Feedr
  class App < Sinatra::Base

    get '/login' do
      redirect to('/') if is_authenticated?

      handlebars :login, locals: { title: 'Login' }
    end

    post '/login' do
      halt 400, "Invalid login or password" unless is_user_params_valid?

      user = UserRepository.authenticate(*user_params)

      if user
        init_session(user.login)
        redirect to('/')
      else
        redirect to('/login')
      end
    end

    get '/signup' do
      redirect to('/') if is_authenticated?

      handlebars :signup, locals: { title: 'Signup' }
    end

    post '/signup' do
      halt 400, "Invalid login or password" unless is_user_params_valid?
      halt 400, "Password mismatch" unless is_password_match?

      user = UserRepository.create(*user_params)
      init_session(user.login)
      redirect to('/')
    end

    get '/logout' do
      clear_session
      redirect to('/login')
    end

  end
end
