class Api::V1::FoodieController < ApplicationController
  def index
    directions = Google::DirectionsService.call(params)
    restaurant = Zomato::RestaurantService.call(params, directions)
    forecast = OpenWeather::CurrentWeatherService.call(params, directions)
    foodie = Foodie.new(directions, restaurant, forecast)
    render json: FoodieSerializer.new(foodie)
  end
end
