class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: login_params[:email])
    if user.nil?
      render json: ErrorSerializer.invalid_email
    elsif user.authenticate(login_params[:password])
      render json: UserSerializer.new(user)
    else
      render json: ErrorSerializer.invalid_password
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
