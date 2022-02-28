class Api::V1::ClubsController < ApplicationController
  def index
    render json: ClubSerializer.new(Club.all)
  end

  def show
    render json: ClubSerializer.new(Club.find(params[:id]))
  end

  def create
    club = Club.create!(club_params)
    render json: ClubSerializer.new(club), status: 201
  end

  private

  def club_params
    params.require(:club).permit(:name, :host_id, :book_id)
  end

end
