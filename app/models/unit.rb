class Unit < ApplicationRecord
  has_many :recipes
  has_many :recipe_sub_recipes
  has_many :recipe_ingredients
end
