class BooksFacade
  def self.get_searched_books(search_term)
    books = BookService.search_books(search_term)
    if books != nil
    books.map do |book|
      Book.new(book)
      # Book.new(book[:volumeInfo])
    end
    end
  end

  def self.get_book(book_id)
    book = BookService.book_info(book_id)
    Book.new(book)
  end
end
