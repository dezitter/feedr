module Feedr
  module Api
    module Helpers

      def unread_entries(options={})
        entries = entry_repository.unread(options)
        all_as_stateful_values(entries)
      end

      def read_entries(options={})
        entries = entry_repository.read(options)
        all_as_values(entries)
      end

      def starred_entries(options={})
        entries = entry_repository.starred(options)
        all_as_values(entries)
      end

      def all_as_stateful_values(entries)
        @states_hash = entry_repository.states_hash

        all_as_values(entries) { |e| as_stateful_values(e) }
      end

      def as_stateful_values(entry)
        if @states_hash.has_key?(entry.id)
          state = @states_hash[entry.id].values
          state = { read: state[:read], starred: state[:starred] }
        else
          state = { read: false, starred:  false }
        end
        state
      end

    end
  end
end
