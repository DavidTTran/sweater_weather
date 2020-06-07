class OpenWeather::ForecastService
  def self.call(geocode)
    parse_response(request('data/2.5/onecall', forecast_params(geocode)))
  end

  private

  def self.forecast_params(geocode)
    { appid: ENV['FORECAST_KEY'],
      lat: geocode.latitude,
      lon: geocode.longitude,
      exclude: 'minutely' }
  end

  def self.connection
    Faraday.new("https://api.openweathermap.org/")
  end

  def self.request(url, params)
    connection.get(url, params)
  end

  def self.parse_response(request)
    JSON.parse(request.body, symbolize_names: true)
  end
end
