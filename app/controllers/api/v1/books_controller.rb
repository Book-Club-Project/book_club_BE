class Api::V1::BooksController < ApplicationController

  def show
    book_id = params[:id]
    render json: BookSerializer.new(BooksFacade.get_book(book_id))
  end

  def search
    searched_title = params[:title]
    render json: BookSerializer.new(BooksFacade.get_searched_books(searched_title))
  end
end
