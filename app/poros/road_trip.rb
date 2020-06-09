class RoadTrip
  attr_reader :id,
              :origin,
              :destination,
              :travel_time,
              :arrival_forecast

  def initialize(directions, forecast)
    @id = nil
    @origin = directions.start_location
    @destination = directions.end_location
    @travel_time = directions.travel_time
    @arrival_forecast = forecast.arrival_forecast
  end
end
