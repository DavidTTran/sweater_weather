class DestinationWeather
  attr_reader :arrival_forecast
  def initialize(forecast, time_shift)
    @arrival_forecast = get_forecast(forecast, time_shift)
  end

  def get_forecast(forecast, time_shift)
    arrival_time = Time.now.to_i + time_shift
    forecast[:hourly].sort_by do |hour|
      (hour[:dt] - arrival_time).abs
    end.first
  end
end
