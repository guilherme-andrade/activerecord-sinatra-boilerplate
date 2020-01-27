require_relative "config/application"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require 'pry-byebug'

require_relative 'models/restaurant'

get "/restaurants" do
	@restaurants = Restaurant.all
	erb :index
end

post "/restaurants" do
	@restaurant = Restaurant.create(name: params["name"], city: params["city"])
	erb :show
end

# this matches /restaurants/new only
get "/restaurants/new" do
	erb :new
end

# this matches /restaurants/any_string
get "/restaurants/:id" do
	@restaurant = Restaurant.find(params["id"])
	erb :show
end
