class Api::V1::CommentsController < ApplicationController
  def index
    render json: CommentSerializer.new(Comment.all)
  end
end
