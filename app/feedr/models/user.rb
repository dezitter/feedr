module Feedr
  class User < Sequel::Model
    many_to_many :feeds, { :join_table => :subscriptions }
    many_to_many :entries, { :join_table => :entries_states }

    plugin :timestamps, :update_on_create => true

    def before_create
      self.password = BCrypt::Password.create(self.password)
      super
    end

    def compare_password(submitted_password)
      BCrypt::Password.new(password) == submitted_password
    end

  end
end
