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

  def destroy
    club = Club.find(params[:id])
    club.delete
  end

  def update
    club = Club.find(params[:id])
    if club.update_attributes(params.permit(:name, :host_id, :book_id))
      render json: ClubSerializer.new(club)
    else
      render json: {error: 'could not update club'}, status: 400
    end
  end

  private

  def club_params
    params.require(:club).permit(:name, :host_id, :book_id)
  end

end
