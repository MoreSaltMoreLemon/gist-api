class Recipe < ApplicationRecord
  belongs_to :user
  has_many  :recipe_ingredients
  has_many  :ingredients, through: :recipe_ingredients

  has_many  :recipe_sub_recipes
  has_many  :sub_recipes, through: :recipe_sub_recipes

  belongs_to :color
  belongs_to :yield_unit, class_name: 'Unit'
  # not currently working. If called by the parent, returns itself
  # if called by the child, returns nothing
  # has_many  :super_recipes, through: :recipe_sub_recipes, source: :recipe

  accepts_nested_attributes_for :recipe_ingredients, :ingredients
end
