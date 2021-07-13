# frozen_string_literal: true

helpers do
  def humanize_date(obj)
    case obj
    when String then format_date(Date.parse(obj))
    when Date then format_date(obj)
    end
  end

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end
end
