class BookSerializer
  include JSONAPI::Serializer

  attributes :title, :authors, :genres, :description, :rating, :image

end
