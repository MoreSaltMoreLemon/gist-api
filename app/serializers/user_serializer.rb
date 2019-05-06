class UserSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :username

  has_many :recipes, each_serializer: RecipeShortSerializer
end