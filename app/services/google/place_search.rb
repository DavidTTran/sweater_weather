class Google::PlaceSearch
  def self.call(location)
    url = 'maps/api/place/findplacefromtext/json'
    response = parse_response(request(url, place_params(location)))
    response[:candidates][0][:photos][0][:photo_reference]
  end

  private

  def self.place_params(location)
    { key: ENV['GEOCODE_KEY'],
      input: location,
      inputtype: 'textquery',
      fields: 'photos' }
  end

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
