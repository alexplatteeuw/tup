# frozen_string_literal: true

helpers do
  def get_params(request, params)
    if request.media_type == 'application/json'
      JSON.parse(request.body.read).transform_keys(&:to_sym)
    else
      params
    end
  end
end
