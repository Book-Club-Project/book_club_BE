class QuoteService
    def self.quote_by_author(search)
      get_data("/services/v2/quotes.php?searchtype=AUTHOR&query=#{search}")
    end

  private
    def self.conn
      Faraday.new(url: "https://www.stands4.com")
    end

    def self.get_data(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
