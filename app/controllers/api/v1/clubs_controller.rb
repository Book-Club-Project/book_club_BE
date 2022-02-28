class Api::V1::ClubsController < ApplicationController
  def index
    render json: ClubSerializer.new(Club.all)
  end

  def show
    render json: ClubSerializer.new(Club.find(params[:id]))
  end

end
