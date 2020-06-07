class Google::GeocodingService
  attr_reader :current_location, :latitude, :longitude
  def initialize(geocode)
    @current_location = geocode[:results][0][:formatted_address]
    @latitude = geocode[:results][0][:geometry][:location][:lat]
    @longitude = geocode[:results][0][:geometry][:location][:lng]
  end

  def self.call(location)
    params = { key: ENV['GEOCODE_KEY'],
               address: location}
    response = parse_response(request("maps/api/geocode/json", params))
    Google::GeocodingService.new(response)
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
