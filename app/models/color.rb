class Color < ApplicationRecord
  has_many :recipes
  has_many :recipe_sub_recipes
  has_many :ingredients
  has_many :recipe_ingredients
end
