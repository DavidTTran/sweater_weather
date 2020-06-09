require 'rails_helper'

describe "login page" do
  it "makes a post request to sessions" do
    api_key = "111111111111"
    User.create(email: "whatever@example.com", password: "password", api_key: api_key)
    params = { "email": "whatever@example.com",
               "password": "password" }

    post "/api/v1/sessions", params: params, as: :json
    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data]).to_not be_empty
    expect(parsed[:data][:attributes][:email]).to eq("whatever@example.com")
    expect(parsed[:data][:attributes][:api_key]).to eq(api_key)
  end

  it "returns an error with invalid credentials" do
    api_key = "111111111111"
    User.create(email: "whatever@example.com", password: "password", api_key: api_key)
    params = { "email": "whatever@example.com",
               "password": "wrongpassword" }

    post "/api/v1/sessions", params: params, as: :json
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:status]).to eq(400)
    expect(parsed[:errors]).to eq("Invalid credentials")
  end
end
