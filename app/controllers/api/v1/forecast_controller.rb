class Api::V1::ForecastController < ApplicationController
  def index
    geocode = get_geocode(params[:location])
    forecast = get_forecast(geocode)
    render json: ForecastSerializer.new(Forecast.new(geocode, forecast))
  end

  private

  def get_geocode(location)
    Google::GeocodingService.call(location)
  end

  def get_forecast(geocode)
    OpenWeather::ForecastService.call(geocode)
  end
end
