class Google::DirectionsService
  def self.call(params)
    params = { origin: params["origin"],
               destination: params["destination"],
               key: ENV['GEOCODE_KEY']}
    response = parse_response(request("maps/api/directions/json", params))
    Directions.new(response)
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
