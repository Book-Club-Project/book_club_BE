class Book
  attr_reader :title, :authors, :genres, :description, :rating, :id, :image, :larger_image
  def initialize(data)

    @id = data[:id]
    @title = data[:volumeInfo][:title]
    @authors = data[:volumeInfo][:authors]
    @genres = data[:volumeInfo][:categories]
    @description = data[:volumeInfo][:description]
    @rating = data[:volumeInfo][:averageRating]
    @image = data[:volumeInfo][:imageLinks][:smallThumbnail]
    @larger_image = data[:volumeInfo][:imageLinks][:thumbnail]
  end
end
