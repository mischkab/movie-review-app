class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment
  has_one :movie
  has_one :user
end
