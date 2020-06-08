require 'rails_helper'

describe "foodie endpoint" do
  it "returns food and weather infomation from a given location and cuisine" do
    get "/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian"
  end
end
