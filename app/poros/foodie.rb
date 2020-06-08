class Foodie
  attr_reader :id
  def initialize(directions_info, restaurant_info, forecast_info)
    @directions = directions_info
    @restaurant = restaurant_info
    @forecast = forecast_info
    @test = restaurant
    @id = 1
  end

  def end_location
    @directions.end_location
  end

  def travel_time
    @directions.travel_time
  end

  def forecast
    { "summary": @forecast.summary,
      "temperature": @forecast.temperature }
  end

  def restaurant
    { "name": @restaurant.name,
      "address": @restaurant.address }
  end
end
