require 'rails_helper'

describe "Forecast requests" do
  it "can take given location params and return forecast in json" do
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
    forecast = JSON.parse(response.body, symbolize_names: true)
    expect(forecast[:data][:type]).to eq("forecast")
    expect(forecast[:data][:attributes][:hourly]).to_not be_empty
    expect(forecast[:data][:attributes][:daily]).to_not be_empty
    expect(forecast[:data][:attributes][:current]).to_not be_empty
    expect(forecast[:data][:attributes][:geocode]).to have_key(:current_location)
  end
end
