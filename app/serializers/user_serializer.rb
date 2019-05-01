class UserSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :username

  has_many :recipes
end