class Api::V1::ClubsController < ApplicationController
  def index
    render json: ClubSerializer.new(Club.all)
  end
end
