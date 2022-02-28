class QuoteSerializer
  include JSONAPI::Serializer

  attributes :quote, :author

end
