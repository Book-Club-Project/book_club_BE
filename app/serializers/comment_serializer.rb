class CommentSerializer
  include JSONAPI::Serializer

  attributes :title, :body, :user_id, :club_id

end
