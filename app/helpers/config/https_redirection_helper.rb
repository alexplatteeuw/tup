# frozen_string_literal: true

helpers do
  def https_required!
    return if ['localhost', '127.0.0.1', '0.0.0.0'].include?(request.host)
    return unless settings.production? && request.scheme == 'http'

    headers['Location'] = request.url.sub('http', 'https')
    halt 301, "https required\n"
  end
end
