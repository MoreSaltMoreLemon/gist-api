class StepIngredient < ApplicationRecord
  belongs_to :recipe_step
  belongs_to :ingredient

  belongs_to :unit

  accepts_nested_attributes_for :ingredient
end
