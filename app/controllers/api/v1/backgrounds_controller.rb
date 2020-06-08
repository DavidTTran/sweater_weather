class Api::V1::BackgroundsController < ApplicationController
  def index
    image = Google::ImageSearch.call(get_reference_id(params[:location]))
    render json: BackgroundSerializer.new(image)
  end

  private

  def get_reference_id(location)
    Google::PlaceSearch.call(location)
  end
end
