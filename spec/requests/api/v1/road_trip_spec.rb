require 'rails_helper'

describe 'road trips' do
  it 'returns origin, destination, travel time, and arrival forecast' do
    api_key = 'abcdefghijklmnop'
    User.create(email: 'email@example.com', password: 'password', api_key: api_key)

    params = { 'origin': 'Denver,CO',
               'destination': 'Pueblo,CO',
               'api_key': api_key }

    post '/api/v1/road_trip', params: params.to_json
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data]).to_not be_empty
    expect(parsed[:data][:type]).to eq('road_trip')
    expect(parsed[:data][:attributes]).to have_key(:origin)
    expect(parsed[:data][:attributes]).to have_key(:destination)
    expect(parsed[:data][:attributes]).to have_key(:travel_time)
    expect(parsed[:data][:attributes]).to have_key(:arrival_forecast)
    expect(parsed[:data][:attributes][:origin]).to eq('Denver, CO, USA')
    expect(parsed[:data][:attributes][:destination]).to eq('Pueblo, CO, USA')
  end

  it 'returns an error if key is incorrect' do
    api_key = 'abc'
    User.create(email: 'email@example.com', password: 'password', api_key: 123)

    params = { 'origin': 'Denver,CO',
               'destination': 'Pueblo,CO',
               'api_key': api_key }

    post '/api/v1/road_trip', params: params.to_json
    parsed = JSON.parse(response.body)
    expect(parsed['status']).to eq(401)
    expect(parsed['errors']).to eq('API key is invalid.')
  end

  it 'returns an error if no key is provided' do
    User.create(email: 'email@example.com', password: 'password', api_key: 123)

    params = { 'origin': 'Denver,CO',
               'destination': 'Pueblo,CO' }

    post '/api/v1/road_trip', params: params.to_json
    parsed = JSON.parse(response.body)
    expect(parsed['status']).to eq(401)
    expect(parsed['errors']).to eq('API key is invalid.')
  end
end
