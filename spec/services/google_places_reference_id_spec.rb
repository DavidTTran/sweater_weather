require 'rails_helper'

describe "Google places API" do
  xit "can search for a place and return a photo reference id" do
    connection = Faraday.new("https://maps.googleapis.com/")
    url = "maps/api/place/findplacefromtext/json"
    params = { key: ENV['GEOCODE_KEY'],
               input: "Denver International Airport",
               inputtype: 'textquery',
               fields: 'photo' }
    request = connection.get(url, params)
    parsed = JSON.parse(request.body, symbolize_names: true)

    expect(parsed[:candidates]).to_no be_empty
    expect(parsed[:candidates][0][:photos][0][:photo_reference]).to_not be_empty
  end
end
