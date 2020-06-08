class Api::V1::FoodieController < ApplicationController
  def index
    foodie = get_foodie
    render json: FoodieSerializer.new(foodie)
  end

  private

  def get_foodie
    directions = get_directions
    restaurant = get_restaurant(directions)
    forecast = get_forecast(directions)
    Foodie.new(directions, restaurant, forecast)
  end

  def get_directions
    Google::DirectionsService.call(params)
  end

  def get_restaurant(directions)
    Zomato::RestaurantService.call(params, directions)
  end

  def get_forecast(directions)
    OpenWeather::CurrentWeatherService.call(directions)
  end
end
