require 'rails_helper'

describe 'Google Geocoding API' do
  it 'returns long/lat coords from a given address' do
    url = 'maps/api/geocode/json'
    params = { address: 'denver',
               key: ENV['GOOGLE_KEY'] }
    connection = Faraday.new('https://maps.googleapis.com/')
    request = connection.get(url, params)
    parsed = JSON.parse(request.body, symbolize_names: true)

    expect(parsed[:status]).to eq('OK')
    expect(parsed[:results]).to_not be_empty
    expect(parsed[:results][0][:geometry]).to_not be_empty
  end
end
