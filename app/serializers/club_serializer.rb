class ClubSerializer
  include JSONAPI::Serializer

  attributes :name, :host_id, :book_id

end
