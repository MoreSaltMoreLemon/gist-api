class UserSerializer < ActiveModel::Serializer
  ActiveModelSerializers.config.default_includes = '**'
  attributes :id, :username, :recipes
  
  has_many :recipes

  # def recipes
  # # byebug
  #   RecipeSerializer.new(object.recipes)
  # end
end