class BooksFacade
  def self.get_searched_books(search_term)
    books = BookService.search_books(search_term)
    books.map do |book|
      Book.new(book[:volumeInfo])
    end
  end

  def self.get_book(book_id)
    book = BookService.book_info(book_id)
    Book.new(book)
  end
end
