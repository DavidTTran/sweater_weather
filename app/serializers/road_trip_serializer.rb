class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin, :destination, :travel_time

  attribute :arrival_forecast do |object|
    temp_to_f = ((object.arrival_forecast[:temp] - 273.15) * 9/5 + 32).round(1)
    { "temperature": temp_to_f,
      "description": object.arrival_forecast[:weather][0][:description] }
  end
end
