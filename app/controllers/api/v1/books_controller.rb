class Api::V1::BooksController < ApplicationController

  def show
    book_id = params[:id]
    render json: BookSerializer.new(BooksFacade.get_book(book_id))
  end
end
