class Coordinates
  attr_reader :location, :longitude, :latitude
  def initialize(geocode_info)
    @location = geocode_info[:results][0][:formatted_address]
    @longitude = geocode_info[:results][0][:geometry][:location][:lng]
    @latitude = geocode_info[:results][0][:geometry][:location][:lat]
  end
end
