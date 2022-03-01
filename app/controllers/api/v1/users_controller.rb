class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end

  def create
    user = User.create!(user_params)
    render json: UserSerializer.new(user), status: 201
  end

  def destroy
    render json: User.delete(params[:id]), status: 204
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password_digest)
  end
end
