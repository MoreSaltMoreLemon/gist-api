class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :ingredient_id, :sequence_order, :quantity, :unit_id, :instruction, :color_id

  belongs_to :recipe, serializer: RecipeShortSerializer
  belongs_to :ingredient

  belongs_to :color
  belongs_to :unit
end
