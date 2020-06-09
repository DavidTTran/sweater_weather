class Forecast
  attr_reader :id, :geocode
  def initialize(geocode, forecast)
    @id = nil
    @geocode = geocode
    @weather = forecast
  end

  def current
    @weather[:current]
  end

  def hourly
    @weather[:hourly]
  end

  def daily
    @weather[:daily]
  end
end
