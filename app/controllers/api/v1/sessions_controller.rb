class Api::V1::SessionsController < ApplicationController
  def create
    login_params = parse_body
    user = User.find_by(email: login_params["email"])
    if user.nil?
      render json: ErrorSerializer.invalid_email
    elsif user.authenticate(login_params["password"])
      render json: UserSerializer.new(user)
    else
      render json: ErrorSerializer.invalid_password
    end
  end

  private

  def parse_body
    JSON.parse(request.body.read)
  end
end
