class Book
  attr_reader :title, :authors, :genres, :description, :rating
  def initialize(data)
    @title = data[:title]
    @authors = data[:authors]
    @genres = data[:categories]
    @description = data[:description]
    @rating = data[:averageRating]
  end
end
