class Ingredient < ApplicationRecord
  has_many :step_ingredients
  has_many :steps, through: :step_ingredients
  has_many :ingredient_yield_in_grams_by_units
  has_many :units, through: :ingredient_yield_in_grams_by_units
end
