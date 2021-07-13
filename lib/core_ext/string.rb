# frozen_string_literal: true

class String
  def to_date
    Date.parse(self, false)
  end
end
