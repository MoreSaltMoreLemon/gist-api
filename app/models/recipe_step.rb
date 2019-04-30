class RecipeStep < ApplicationRecord
  belongs_to  :recipe
  has_many    :step_ingredients
  has_many    :ingredients, through: :step_ingredients
  has_many    :step_sub_recipes
  has_many    :sub_recipes, through: :step_sub_recipes, class_name: 'Recipe'
end
