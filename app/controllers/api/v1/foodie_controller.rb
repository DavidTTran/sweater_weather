class Api::V1::FoodieController < ApplicationController
  def index
    connection = Faraday.new("https://maps.googleapis.com/")
    url = "maps/api/directions/json"
    directions_params = { origin: params[:start],
               destination: params[:end],
               key: ENV['GEOCODE_KEY']}
    response = connection.get(url, directions_params)
    directions = JSON.parse(response.body, symbolize_names: true)
    Direction.new(directions)

    
  end
end
