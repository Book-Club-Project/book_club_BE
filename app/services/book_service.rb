class BookService
  def self.search_books(search)
    get_data("/books/v1/volumes?q=#{search}")[:items]
  end

  def self.book_by_isbn(isbn)
    get_data("/books/v1/volumes?q=isbn:#{isbn}")[:items][0]
  end

  def self.book_info(book_id)
    get_data("/books/v1/volumes/#{book_id}")
  end

  private
    def self.conn
      Faraday.new(url: "https://www.googleapis.com")
    end

    def self.get_data(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
