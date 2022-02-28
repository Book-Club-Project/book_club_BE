require 'rails_helper'


RSpec.describe Quote do
  it 'exists' do
    data = {result: {
            quote: "Just Do It",
            author: "Nike",
            }}
    quote = Quote.new(data)

    expect(quote).to be_an_instance_of(Quote)
    expect(quote.quote).to eq("Just Do It")
    expect(quote.author).to eq("Nike")
  end
end
