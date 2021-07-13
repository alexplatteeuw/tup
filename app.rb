# frozen_string_literal: true

require 'sinatra'
require 'pony'

configure do
  Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each { |f| load(f) }
  Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| load(f) }
  DEFAULT_META = YAML.load_file("#{File.dirname(__FILE__)}/app/config/meta.yml")
  set :public_folder, 'public'
  set :views, File.join(settings.root, 'app', 'views')
end

configure :development, :test do |c|
  require 'dotenv/load'
  require 'sinatra/reloader'
  require 'pry'
  c.also_reload './app/**/*.rb'
  c.also_reload './lib/**/*.rb'
end

before(%r{/(tup|results)}) do
  params = get_params(request, @params)
  @starting_point = params[:starting_point]
  date = params[:date]
  @tup = build_tup(@starting_point, date)

  @publication = @tup.publication
  @opposition_start = @tup.opposition_start
  @legal_effect = @tup.legal_effect
  @theoretical_opposition_end = @tup.theoretical_opposition_end
  @opposition_end = @tup.opposition_end
  @publications = @tup.publications
end

get '/' do
  erb :home
end

post '/results' do
  erb :'simulator/results', layout: false
end

get '/start' do
  erb :'simulator/starting_points', layout: false
end

post '/tup' do
  erb :home
end

get '/contact' do
  erb :contact
end

post '/contact' do
  send_email(params[:email], params[:subject], params[:email], params[:message])
  @success = true
  erb :contact
end

get '/about' do
  erb :about
end
