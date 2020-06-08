class Zomato::RestaurantService
  def self.call(params, directions)
    header = { "user-key": ENV['ZOMATO_KEY'] }
    request = request("api/v2.1/search", params(params, directions), header)
    response = parse_response(request)
    Restaurant.new(response)
  end

  private

  def self.params(params, directions)
    { count: 1,
      cuisine: params[:search],
      lat: directions.end_coords[:lat],
      lon: directions.end_coords[:lng] }
  end

  def self.connection
    Faraday.new("https://developers.zomato.com")
  end

  def self.request(url, params, header)
    connection.get(url, params, header)
  end

  def self.parse_response(request)
    JSON.parse(request.body, symbolize_names: true)
  end
end
