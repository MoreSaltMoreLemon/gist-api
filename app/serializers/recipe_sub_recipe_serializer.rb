class RecipeSubRecipeSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :sub_recipe_id, :sequence_order, :quantity, :unit_id, :instruction, :color_id
  # byebug
  belongs_to :recipe, serializer: RecipeShortSerializer
  belongs_to :sub_recipe, class_name: "Recipe", foreign_key: 'sub_recipe_id', serializer: RecipeShortSerializer

  belongs_to :color
  belongs_to :unit
end