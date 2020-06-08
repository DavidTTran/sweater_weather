class Api::V1::FoodieController < ApplicationController
  def index
    directions = Google::DirectionsService.call(params)
    restaurant = Restaurant.new(get_restaurant(params, directions))
    forecast = get_forecast(params, directions)
    foodie = Foodie.new(directions, restaurant, forecast)
    render json: FoodieSerializer.new(foodie)
  end

  private

  def get_restaurant(params, directions)
    connection = Faraday.new("https://developers.zomato.com")
    url = "api/v2.1/search"
    params = { count: 1,
               cuisine: params[:search],
               lat: directions.end_coords[:lat],
               lon: directions.end_coords[:lng] }
    header = { "user-key": ENV['ZOMATO_KEY'] }
    request = connection.get(url, params, header)
    JSON.parse(request.body, symbolize_names: true)
  end

  def get_forecast(params, directions)
    connection = Faraday.new("https://api.openweathermap.org/")
    url = 'data/2.5/onecall'
    params = { appid: ENV['FORECAST_KEY'],
               lat: directions.end_coords[:lat],
               lon: directions.end_coords[:lng],
               exclude: 'hourly,daily,minutely' }
    request = connection.get(url, params)
    JSON.parse(request.body, symbolize_names: true)
  end
end
