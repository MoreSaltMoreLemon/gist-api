class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :color_id

  # has_many :recipe_ingredients

  belongs_to :color
end
