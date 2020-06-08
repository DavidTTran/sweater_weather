class Foodie
  attr_reader :id
  def initialize(directions_info, restaurant_info, forecast_info)
    @directions = directions_info
    @restraunt = restaurant_info
    @forecast = forecast_info
    @test = forecast
    @id = 1
  end

  def end_location
    @directions.end_location
  end

  def travel_time
    @directions.travel_time
  end

  def forecast
    { "summary": @forecast[:current][:weather][0][:description],
      "temperature": @forecast[:current][:temp] }
  end

  def restaurant
  end
end
