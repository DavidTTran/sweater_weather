require 'rails_helper'

describe "foodie endpoint" do
  it "returns food and weather infomation from a given location and cuisine" do
    get "/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian"
    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:type]).to eq("foodie")
    expect(parsed[:data][:attributes]).to have_key(:end_location)
    expect(parsed[:data][:attributes][:end_location]).to eq("Pueblo, CO, USA")
    expect(parsed[:data][:attributes]).to have_key(:travel_time)
    expect(parsed[:data][:attributes]).to have_key(:forecast)
    expect(parsed[:data][:attributes][:forecast]).to have_key(:summary)
    expect(parsed[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(parsed[:data][:attributes][:restaurant]).to have_key(:name)
    expect(parsed[:data][:attributes][:restaurant]).to have_key(:address)
  end

  it "different params" do
    get "/api/v1/foodie?start=denver,co&end=orlando,fl&search=mexican"
    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:type]).to eq("foodie")
    expect(parsed[:data][:attributes]).to have_key(:end_location)
    expect(parsed[:data][:attributes]).to have_key(:travel_time)
    expect(parsed[:data][:attributes]).to have_key(:forecast)
    expect(parsed[:data][:attributes][:forecast]).to have_key(:summary)
    expect(parsed[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(parsed[:data][:attributes][:restaurant]).to have_key(:name)
    expect(parsed[:data][:attributes][:restaurant]).to have_key(:address)
  end
end
