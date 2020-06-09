class OpenWeather::ForecastService
  def self.call(coordinates)
    request = request('data/2.5/onecall', forecast_params(coordinates))
    response = parse_response(request)
    Forecast.new(response, coordinates)
  end

  def self.forecast_params(coordinates)
    { appid: ENV['FORECAST_KEY'],
      lat: coordinates.latitude,
      lon: coordinates.longitude,
      exclude: 'minutely' }
  end

  def self.connection
    Faraday.new('https://api.openweathermap.org/')
  end

  def self.request(url, params)
    connection.get(url, params)
  end

  def self.parse_response(request)
    JSON.parse(request.body, symbolize_names: true)
  end
end
