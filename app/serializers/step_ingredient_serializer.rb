class StepIngredientSerializer < ActiveModel::Serializer
  attributes :id, :recipe_step_id, :ingredient_id, :sequence_order, :quantity, :unit_id, :instruction, :color, :is_sub_recipe

  belongs_to :recipe_step
  belongs_to :ingredient
  
  belongs_to :unit
end
