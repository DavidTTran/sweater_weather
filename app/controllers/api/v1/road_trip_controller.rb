class Api::V1::RoadTripController < ApplicationController
  def create
    params = parse_body
    if valid_key?(params)
      render json: RoadTripSerializer.new(get_road_trip(params))
    else
      render json: ErrorSerializer.invalid_key
    end
  end

  private

  def get_road_trip(params)
    directions = Google::DirectionsService.call(params)
    forecast = OpenWeather::DestinationForecastService.call(directions)
    RoadTrip.new(directions, forecast)
  end

  def parse_body
    JSON.parse(request.body.read)
  end

  def valid_key?(params)
    User.find_by(api_key: params['api_key'])
  end
end
