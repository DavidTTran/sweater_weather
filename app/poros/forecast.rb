class Forecast
  attr_reader :id, :location, :forecast
  def initialize(forecast, coordinates)
    @id = nil
    @location = location_info(coordinates)
    @forecast = forecast
  end

  def location_info(coordinates)
    { 'location': coordinates.location,
      'longitude': coordinates.longitude,
      'latitude': coordinates.latitude }
  end

  def hourly
    @forecast[:hourly]
  end

  def daily
    @forecast[:daily]
  end
end
