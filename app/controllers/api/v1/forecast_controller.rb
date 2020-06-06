class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = Google::GeocodingService.call(params[:location])
    forecast = OpenWeather::ForecastService.call(latlon(coordinates))
  end

  private

  def latlon(coordinates)
    coordinates[:results][0][:geometry][:location]
  end
end
