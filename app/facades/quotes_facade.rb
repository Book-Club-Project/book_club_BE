class QuotesFacade
  def self.get_random_quote
    quote = QuoteService.random_quote
    Quote.new(quote)
  end
end
