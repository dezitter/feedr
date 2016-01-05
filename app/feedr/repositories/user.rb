module Feedr
  class UserRepository

    def create(login, password)
      User.create(login: login, password: password)
    end

    def find(login)
      User.find(login: login)
    end

    def authenticate(login, password)
      user = self.find(login)

      return user if user and user.compare_password(password)
      return nil
    end

  end
end
