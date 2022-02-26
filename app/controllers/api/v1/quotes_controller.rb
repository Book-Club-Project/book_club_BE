class Api::V1::QuotesController < ApplicationController
  def index
    render json: QuoteSerializer.new(QuotesFacade.get_random_quote)
  end
end
