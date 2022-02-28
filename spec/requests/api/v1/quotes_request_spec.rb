require 'rails_helper'


RSpec.describe "quote API" do
  it "it can get book attributes", :vcr do
    get "/api/v1/quote"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    quote = JSON.parse(response.body, symbolize_names: true)

    expect(quote).to be_a(Hash)
    expect(quote[:data][:attributes][:author]).to be_a String
    expect(quote[:data][:attributes][:quote]).to be_a String
  end
end
