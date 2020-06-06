require 'rails_helper'

describe "Forecast requests" do
  it "routes exist" do
    get "/api/v1/forecast"
  end

  it "can take given params and request long/lat from Google" do
    get "/api/v1/forecast?location=denver,co"
  end
end
