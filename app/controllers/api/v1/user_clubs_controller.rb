class Api::V1::UserClubsController < ApplicationController
  def index
    render json: ClubSerializer.new(User.find(params[:user_id]).clubs)
  end
end
