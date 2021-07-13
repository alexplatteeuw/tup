# frozen_string_literal: true

helpers do
  def impossible_effect?(opposition_end)
    opposition_end&.to_date&.day_off?
  end

  def possible_effect?(opposition_end)
    !impossible_effect?(opposition_end)
  end

  def legal_effect?(starting_point)
    starting_point == 'legal_effect'
  end

  def publication?(starting_point)
    starting_point == 'publication'
  end
end
