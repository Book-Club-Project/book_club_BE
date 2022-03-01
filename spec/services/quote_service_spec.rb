require 'rails_helper'

RSpec.describe QuoteService do
  it 'returns a random quote' do
    random_quote_response = File.read('./spec/support/stubbed_api_responses/random_quote_response.json')
    stub_request(:get, "https://www.abbreviations.com/services/v2/quotes.php?format=json&searchtype=RANDOM&uid=#{ENV['quote_id']}&tokenid=#{ENV['quote_token']}")
    .to_return(body: random_quote_response, status: 200)

    random = QuoteService.random_quote

    expect(random).to be_a Hash

    expect(random[:result][:quote]).to be_a String
    expect(random[:result][:author]).to be_a String
  end
end
