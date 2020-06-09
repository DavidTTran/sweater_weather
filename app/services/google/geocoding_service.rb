class Google::GeocodingService
  def self.call(location)
    params = { key: ENV['GOOGLE_KEY'],
               address: location }
    response = parse_response(request('maps/api/geocode/json', params))
    return nil if response[:results] == []

    Coordinates.new(response)
  end

  def self.connection
    Faraday.new('https://maps.googleapis.com/')
  end

  def self.request(url, params)
    connection.get(url, params)
  end

  def self.parse_response(request)
    JSON.parse(request.body, symbolize_names: true)
  end
end
