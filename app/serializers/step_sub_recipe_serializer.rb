class StepSubRecipeSerializer < ActiveModel::Serializer
  attributes :id, :recipe_step_id, :sub_recipe_id, :sequence_order, :quantity, :unit_id, :instruction, :color_id, :is_sub_recipe

  belongs_to :recipe_step
  belongs_to :sub_recipe, class_name: "Recipe", foreign_key: 'sub_recipe_id', serializer: RecipeShortSerializer


  belongs_to :color
  belongs_to :unit
end
