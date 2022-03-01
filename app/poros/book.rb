class Book
  attr_reader :title, :authors, :genres, :description, :rating, :id, :image
  def initialize(data)
    @id = data[:id]
    @title = data[:volumeInfo][:title]
    @authors = data[:volumeInfo][:authors]
    @genres = data[:volumeInfo][:categories]
    @description = data[:volumeInfo][:description]
    @rating = data[:volumeInfo][:averageRating]
    @image = data[:volumeInfo][:imageLinks][:smallThumbnail]
  end
end
