class StepIngredient < ApplicationRecord
  belongs_to  :step
  belongs_to  :ingredient
  belongs_to  :recipe
end
