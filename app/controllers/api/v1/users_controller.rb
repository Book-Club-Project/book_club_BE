class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end

  def create
    user = User.find_or_create_by(user_params)
    render json: UserSerializer.new(user), status: 201
  end

  def update
    user =  User.find(params[:id])
    if user.update(user_params)
      render json: UserSerializer.new(user), status: 200
    else
      render json: { data: "User cannot be updated. Please check your input"}
    end
  end

  def destroy
    user = User.find(params[:id])
    user.delete
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
