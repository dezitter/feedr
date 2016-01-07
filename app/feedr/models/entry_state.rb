module Feedr
  class EntryState < Sequel::Model(:entries_states)
    unrestrict_primary_key
  end
end
