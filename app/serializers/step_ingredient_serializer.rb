class StepIngredientSerializer < ActiveModel::Serializer
  attributes :id, :step_id, :sequence_order, :ingredient_id, :recipe_id, :quantity, :unit_id, :fixed, :ingredient, :recipe

  belongs_to  :step
  has_one     :ingredient
  has_one     :recipe
end