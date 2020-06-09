require 'rails_helper'

describe "Open Weather API" do
  it "returns forcast information given longitude latitude" do
    connection = Faraday.new("https://api.openweathermap.org/")
    url = "data/2.5/onecall"
    params = { appid: ENV['FORECAST_KEY'],
               lat: 39.7392,
               lon: -104.9903,
               exclude: 'minutely' }
    request = connection.get(url, params)

    parsed = JSON.parse(request.body, symbolize_names: true)
    expect(parsed[:timezone]).to eq("America/Denver")
    expect(parsed[:current]).to_not be_empty
    expect(parsed[:hourly]).to_not be_empty
    expect(parsed[:daily]).to_not be_empty
  end
end
