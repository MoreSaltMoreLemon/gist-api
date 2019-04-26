class StepIngredientSerializer < ActiveModel::Serializer
  attributes :id, :step_id, :sequence_order, :ingredient_id, :recipe_id, :quantity, :unit_id, :fixed

  belongs_to  :step
end