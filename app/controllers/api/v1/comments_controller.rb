class Api::V1::CommentsController < ApplicationController
  def index
    render json: CommentSerializer.new(Comment.all)
  end

  def create
    comment = Comment.create!(comment_params)
    render json: CommentSerializer.new(comment), status: 201
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :user_id, :club_id)
  end
end
