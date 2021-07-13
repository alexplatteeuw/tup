# frozen_string_literal: true

require './app'

if ENV['RACK_ENV'] != 'production'
  require 'rack-proxy'

  class WebpackProxy < Rack::Proxy
    def rewrite_env(env)
      env['HTTP_HOST'] = 'localhost:8080'
      env
    end
  end

  run Rack::URLMap.new(
    '/dist' => WebpackProxy.new,
    '/' => Sinatra::Application
  )
else
  run Sinatra::Application
end
