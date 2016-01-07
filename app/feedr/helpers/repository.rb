module Feedr
  module Helpers

    def entry_repository
      EntryRepository.new(current_user)
    end

    def feed_repository
      FeedRepository.new(current_user)
    end

    def user_repository
      UserRepository.new
    end

  end
end
