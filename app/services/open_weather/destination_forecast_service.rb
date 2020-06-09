class OpenWeather::DestinationForecastService
  def self.call(directions)
    request = request('data/2.5/onecall', search_params(directions))
    response = parse_response(request)
    DestinationWeather.new(response, directions.time_unix)
  end

  def self.search_params(directions)
    { appid: ENV['FORECAST_KEY'],
      lat: directions.end_coords[:lat],
      lon: directions.end_coords[:lng],
      exclude: 'daily,minutely,current' }
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
