require 'rails_helper'

RSpec.describe QuoteService do
  it 'returns a random quote', :vcr do

    random = QuoteService.random_quote

    expect(random).to be_a Hash

    expect(random[:result][:quote]).to be_a String
    expect(random[:result][:author]).to be_a String
  end
end
