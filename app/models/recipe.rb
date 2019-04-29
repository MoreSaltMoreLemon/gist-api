class Recipe < ApplicationRecord
  belongs_to :user
  has_many  :recipe_ingredients
  has_many  :ingredients, through: :recipe_ingredients

  has_many  :recipe_sub_recipes
  has_many  :sub_recipes, through: :recipe_sub_recipes
  # not currently working. If called by the parent, returns itself
  # if called by the child, returns nothing
  # has_many  :super_recipes, through: :recipe_sub_recipes, source: :recipe
end
