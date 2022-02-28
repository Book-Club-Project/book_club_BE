require 'rails_helper'

RSpec.describe BooksFacade do
  describe '::get_searched_books' do
    it 'returns a list of the books meeting the search term', :vcr do
      books = BooksFacade.get_searched_books("Pride")
      expect(books).to be_an Array
      expect(books.first).to be_a Book

      books.each do |book|
        expect(book).to be_a Book
      end
    end
  end

  describe '::get_book' do
    it 'returns a single book object', :vcr do
      book = BooksFacade.get_book("ZV9DDwAAQBAJ")
      expect(book).to be_a Book
    end
  end
end
