class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :hourly, :current, :daily, :geocode
end
