class OpenWeather::CurrentWeatherService
  def self.call(params, directions)
    request = request('data/2.5/onecall', search_params(params, directions))
    response = parse_response(request)
    require "pry"; binding.pry
  end

  private

  def self.search_params(params, directions)
    { appid: ENV['FORECAST_KEY'],
      lat: directions.end_coords[:lat],
      lon: directions.end_coords[:lng],
      exclude: 'hourly,daily,minutely' }
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
