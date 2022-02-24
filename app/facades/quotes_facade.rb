class QuotesFacade
  def self.get_quote_by_author(search)
    quotes = QuoteService.quote_by_author(search)

    quotes.map do |quote|
      Quote.new(quote)
    end
  end
end
