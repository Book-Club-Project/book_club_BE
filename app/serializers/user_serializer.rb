class UserSerializer
  include JSONAPI::Serializer

  attributes :username, :email

  attributes :password_digest do |object|
    object.password_digest
  end

end
