require 'rails_helper'

describe "new user route" do
  it "can post a new user" do
    create(:user)
    expect(User.count).to eq(1)
    params = { "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password" }

    post "/api/v1/users", params: params
    expect(response).to be_successful
    expect(User.count).to eq(2)

    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data]).to_not be_empty
    expect(parsed[:data][:id]).to_not be_empty
    expect(parsed[:data][:attributes][:email]).to eq("whatever@example.com")
    expect(parsed[:data][:attributes][:api_key]).to_not be_empty
  end

  it "can't post if email already exists, or if passwords don't match" do
    create(:user, email: "123@example.com")
    params = { "email": "123@example.com",
               "password": "password",
               "password_confirmation": "wrong_password" }

    post "/api/v1/users", params: params
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:status]).to eq(400)
    expect(parsed[:errors][0]).to eq("Email has already been taken")
    expect(parsed[:errors][1]).to eq("Password confirmation doesn't match Password")
  end
end
