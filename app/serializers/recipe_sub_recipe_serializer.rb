class RecipeSubRecipeSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :sub_recipe_id

  belongs_to :recipe
  belongs_to :sub_recipe, class_name: "Recipe", foreign_key: 'sub_recipe_id', serializer: RecipeShortSerializer
end