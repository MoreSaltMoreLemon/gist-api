class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  belongs_to :color
  belongs_to :unit
  
  accepts_nested_attributes_for :ingredient
end
