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
    expect(forecast[:data][:attributes][:location]).to_not be_empty
    expect(forecast[:data][:attributes][:location][:location]).to eq("Denver, CO, USA")
    forecast[:data][:attributes][:daily].each do |day|
      expect(day).to have_key(:temp)
      expect(day).to have_key(:weather)
    end
  end

  it "returns an error if the location is wrong" do
    get "/api/v1/forecast?location=qkwjeqle"
    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:status]).to eq(200)
    expect(parsed[:data][:results]).to eq([])
  end
end
