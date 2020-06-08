class Google::ImageSearch
  attr_reader :url, :id
  def initialize(image_url)
    @url = image_url
    @id = 1
  end

  def self.call(reference)
    url = 'maps/api/place/photo'
    image_html = request(url, image_params(reference))
    Google::ImageSearch.new(image_html.env.url.to_s)
  end

  private

  def self.image_params(reference)
    { key: ENV['GEOCODE_KEY'],
      photoreference: reference,
      maxwidth: 1080 }
  end

  def self.connection
    Faraday.new("https://maps.googleapis.com/")
  end

  def self.request(url, params)
    connection.get(url, params)
  end
end
