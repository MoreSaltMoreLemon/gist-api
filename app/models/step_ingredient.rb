class StepIngredient < ApplicationRecord
  belongs_to  :step
  # has_one  :ingredient
  # has_one  :recipe
end
