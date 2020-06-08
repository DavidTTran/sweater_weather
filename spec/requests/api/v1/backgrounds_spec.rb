require 'rails_helper'

describe "Backgrounds route" do
  it "returns an image when given an address/location" do
    get "/api/v1/backgrounds?location=denver,co"
    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    
    expect(parsed[:data]).to_not be_empty
    expect(parsed[:data][:attributes][:url]).to_not be_empty
  end
end
