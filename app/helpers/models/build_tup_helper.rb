# frozen_string_literal: true

helpers do
  def build_tup(starting_point, date)
    case starting_point
    when 'publication' then Tup.new(publication: date)
    when 'legal_effect' then Tup.new(legal_effect: date)
    end
  end
end
