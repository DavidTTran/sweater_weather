class Api::V1::ForecastController < ApplicationController
  def index
    forecast = get_forecast(params[:location])
    if forecast
      render json: ForecastSerializer.new(forecast)
    else
      render json: ErrorSerializer.no_results
    end
  end

  private

  def get_forecast(location)
    coordinates = Google::GeocodingService.call(location)
    return nil if coordinates.nil?

    OpenWeather::ForecastService.call(coordinates)
  end
end
