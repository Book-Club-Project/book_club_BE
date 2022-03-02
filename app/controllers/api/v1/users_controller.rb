class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end

  def create
    require "pry"; binding.pry
    user = User.find_by(email: params[:email])

    if user
      render json: UserSerializer.new(user), status: 201
    else
      new_user = User.create!(user_params)
      render json: UserSerializer.new(new_user), status: 201
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
