class Google::GeocodingService

  def self.call(location)
    params = { key: ENV['GEOCODE_KEY'],
               address: location}
    parse_response(request("maps/api/geocode/json", params))
  end

  private

  def self.connection
    Faraday.new("https://maps.googleapis.com/")
  end

  def self.request(url, params)
    connection.get(url, params)
  end

  def self.parse_response(request)
    JSON.parse(request.body, symbolize_names: true)
  end
end
