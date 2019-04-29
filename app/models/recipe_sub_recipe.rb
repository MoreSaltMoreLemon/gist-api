class RecipeSubRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :sub_recipe, class_name: "Recipe", foreign_key: 'sub_recipe_id'

  belongs_to :color
  belongs_to :unit
end
