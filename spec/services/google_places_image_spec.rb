require 'rails_helper'

describe "Google Places Image api" do
  it "returns a picture with given picture reference id" do
    connection = Faraday.new("https://maps.googleapis.com/")
    url = "maps/api/place/photo"
    params = { key: ENV['GOOGLE_KEY'],
               photoreference: "CmRaAAAAll6Qf2FtpCPCoaIfdK1kO_8yOQxpOdIehA5U1_oLQlwwYJc5ltpGrMJui8OafInwqfLNFIuYK84A5pIsqxNFcqsSFh9rpNM1bCH8O4bSUeYnF-ku8lzKnkdL_aVhg7azEhCJHTXNR18hzbhfk8rKqrGhGhT6L5ispm3SZ27Z9LbbO5ekesXq7w",
               maxwidth: 1080 }
    request = connection.get(url, params)
    expect(request.status).to eq(302)
    expect(request.reason_phrase).to eq("Found")
  end
end
