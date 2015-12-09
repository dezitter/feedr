module Feedr
  module ViewHelpers

    [:published].each do |property|

      define_method("format_#{property}_date") do
        date_time = self[property]

        return date_time if date_time.is_a?(String)
        return date_time.strftime("%D %T")
      end

    end

  end
end
