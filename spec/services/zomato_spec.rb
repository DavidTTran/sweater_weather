require 'rails_helper'

describe "Zomato API" do
  it "returns a restraunt's name and address given lat/long" do
    connection = Faraday.new("https://developers.zomato.com")
    url = "api/v2.1/search"
    params = { count: 1,
               cuisine: 'italian',
               lat: 38.2542053,
               lon: -104.6087488 }
    header = { "user-key": ENV['ZOMATO_KEY'] }

    request = connection.get(url, params, header)
    parsed = JSON.parse(request.body, symbolize_names: true)
    expect(parsed[:results_shown]).to eq(1)
    expect(parsed[:restaurants][0][:restaurant]).to have_key(:name)
    expect(parsed[:restaurants][0][:restaurant]).to have_key(:location)
    expect(parsed[:restaurants][0][:restaurant][:location]).to have_key(:address)
  end
end
