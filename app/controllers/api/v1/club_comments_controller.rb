class Api::V1::ClubCommentsController < ApplicationController
  def index
    render json: CommentSerializer.new(Club.find(params[:club_id]).comments)
  end
end
