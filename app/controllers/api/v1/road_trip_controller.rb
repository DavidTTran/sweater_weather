class Api::V1::RoadTripController < ApplicationController
  def create
    road_trip_params = parse_body
    if validate_key(road_trip_params)
      render json: RoadTripSerializer.new(get_road_trip)
    else
      render json: ErrorSerializer.invalid_key
    end
  end

  private

  def get_road_trip
    directions = Google::DirectionsService.call(road_trip_params)
    forecast = OpenWeather::DestinationForecastService.call(directions)
    Roadtrip.new(directions, forecast)
  end

  def parse_body
    JSON.parse(request.body.read)
  end

  def validate_key(road_trip_params)
    User.find_by(api_key: road_trip_params["api_key"])
  end
end
