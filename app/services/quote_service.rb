class QuoteService
    def self.random_quote
      get_data("/services/v2/quotes.php?format=json&searchtype=RANDOM")
    end

  private
    def self.conn

      Faraday.new(url: "https://www.abbreviations.com") do |faraday|

        faraday.params[:uid] = ENV['quote_id']
        faraday.params[:tokenid] = ENV['quote_token']
      end
    end

    def self.get_data(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
