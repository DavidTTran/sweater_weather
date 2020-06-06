class OpenWeather::ForecastService
  def self.call(coordinates)
    parse_response(request('data/2.5/onecall', forecast_params(coordinates)))
  end

  private

  def self.forecast_params(coordinates)
    { appid: ENV['FORECAST_KEY'],
      lat: coordinates[:lat],
      lon: coordinates[:lng],
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
