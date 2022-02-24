require 'rails_helper'


RSpec.describe "books API" do

  it "it can get book attributes  " do

    get "/api/v1/books/ZV9DDwAAQBAJ"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    book = JSON.parse(response.body, symbolize_names: true)

    expect(book).to be_a(Hash)
    expect(book[:data][:attributes][:title]).to eq("Pride")
  end
end
