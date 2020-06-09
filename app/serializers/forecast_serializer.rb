class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :hourly, :daily

  attribute :current do |object|
    { date_time: object.forecast[:current][:dt],
      sunrise: object.forecast[:daily][0][:sunrise],
      sunset: object.forecast[:daily][0][:sunset],
      temperature: object.forecast[:daily][0][:temp],
      feels_like: object.forecast[:daily][0][:feels_like],
      humidity: object.forecast[:daily][0][:humidity],
      clouds: object.forecast[:daily][0][:clouds],
      uvi: object.forecast[:daily][0][:uvi],
      weather: object.forecast[:current][:weather] }
  end
end
