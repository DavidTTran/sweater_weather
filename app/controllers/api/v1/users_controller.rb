class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      user.create_key
      render json: UserSerializer.new(user)
    else
      render json: ErrorSerializer.new(user.errors)
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
