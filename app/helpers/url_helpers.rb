# frozen_string_literal: true

helpers do
  def base_url
    request.base_url
  end

  def original_url
    request.base_url + request.path_info
  end

  def tup_url
    '/tup'
  end
end
