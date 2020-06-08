class CurrentWeather
  attr_reader :temperature, :summary
  def initialize(info)
    @temperature = temp_to_f(info[:current][:temp])
    @summary = info[:current][:weather][0][:description]
  end

  def temp_to_f(temp)
    (((temp) - 273.15) * (9/5) + 32).round(1)
  end
end
