class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :hourly, :daily

  attribute :current do |object|
    { date_time: object.forecast[:current][:dt],
      sunrise: object.forecast[:daily][-1][:sunrise],
      sunset: object.forecast[:daily][-1][:sunset],
      temperature: object.forecast[:daily][-1][:temp],
      feels_like: object.forecast[:daily][-1][:feels_like],
      humidity: object.forecast[:daily][-1][:humidity],
      clouds: object.forecast[:daily][-1][:clouds],
      uvi: object.forecast[:daily][-1][:uvi],
      weather: object.forecast[:current][:weather] }
  end
end
