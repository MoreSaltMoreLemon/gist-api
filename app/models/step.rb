class Step < ApplicationRecord
  belongs_to  :recipe
  has_many    :step_ingredients
  has_many    :ingredients, through: :step_ingredients

  accepts_nested_attributes_for :step_ingredients, allow_destroy: true
end
