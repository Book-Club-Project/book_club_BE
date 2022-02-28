require 'rails_helper'


RSpec.describe "books API" do

  it "it can get book attributes", :vcr do

    get "/api/v1/books/ZV9DDwAAQBAJ"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    book = JSON.parse(response.body, symbolize_names: true)

    expect(book).to be_a(Hash)
    expect(book[:data][:attributes][:title]).to eq("Pride")
  end

  it "it can get books searched by title", :vcr do

    get "/api/v1/books/search?title=pride"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    books = JSON.parse(response.body, symbolize_names: true)
    expect(books).to be_an(Hash)

    books.each do |book|
      expect(book[1][0][:attributes][:title]).to eq("Pride")
      expect(book[1][0][:attributes][:authors]).to eq(["Ibi Zoboi"])
      expect(book[1][0][:attributes][:genres]).to eq(["Young Adult Fiction"])
      expect(book[1][0][:attributes][:description]).to be_a(String)
    end
  end

end
