require 'rails_helper'

describe "Google Direction API" do
  it "returns the travel time between two locations" do
    connection = Faraday.new("https://maps.googleapis.com/")
    url = "maps/api/directions/json"
    params = { origin: "denver,co",
               destination: "pueblo,co",
               key: ENV['GOOGLE_KEY']}
    request = connection.get(url, params)

    parsed = JSON.parse(request.body, symbolize_names: true)
    expect(parsed[:routes][0][:legs][0][:duration][:text]).to_not be_empty
    expect(parsed[:routes][0][:legs][0][:duration][:text]).to eq("1 hour 48 mins")
    expect(parsed[:routes][0][:legs][0][:end_address]).to eq("Pueblo, CO, USA")
  end
end
