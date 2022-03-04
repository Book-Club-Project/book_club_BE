require 'rails_helper'

RSpec.describe QuotesFacade do
  describe 'returns a quote and author' do
    xit 'returns a random quote and the author', :vcr do
      quote = QuotesFacade.get_random_quote

      expect(quote).to be_an Quote
      expect(quote.quote).to be_a String
      expect(quote.author).to be_a String
    end
  end
end
