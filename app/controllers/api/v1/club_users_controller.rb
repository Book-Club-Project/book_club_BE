class Api::V1::ClubUsersController < ApplicationController
  def index
    render json: UserSerializer.new(Club.find(params[:club_id]).users)
  end
end
