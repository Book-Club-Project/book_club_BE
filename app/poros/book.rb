class Book
  attr_reader :title, :authors, :genres, :description, :rating, :id
  def initialize(data)
    @id = data[:id]
    @title = data[:volumeInfo][:title]
    @authors = data[:volumeInfo][:authors]
    @genres = data[:volumeInfo][:categories]
    @description = data[:volumeInfo][:description]
    @rating = data[:volumeInfo][:averageRating]
  end
end
