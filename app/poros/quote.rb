class Quote
  attr_reader :quote, :author, :id

  def initialize(data)
    @id = data[:id]
    @quote = data[:result][:quote]
    @author = data[:result][:author]
  end
end
