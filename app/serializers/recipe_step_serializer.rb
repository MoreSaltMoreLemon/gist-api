class RecipeStepSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :color, :name, :instruction, :yield, :yeild_in_grams, :yield_unit_id, :sequence_order

  belongs_to  :recipe, serializer: RecipeShortSerializer
  has_many    :step_ingredients
  # has_many    :ingredients, through: :step_ingredients
  has_many    :step_sub_recipes
  # has_many    :sub_recipes, through: :step_sub_recipes, class_name: 'Recipe'
  
end
