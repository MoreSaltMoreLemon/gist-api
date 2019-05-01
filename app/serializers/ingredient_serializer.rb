class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :name

  # has_many :recipe_ingredients
end
