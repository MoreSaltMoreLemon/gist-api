class StepSubRecipe < ApplicationRecord
  belongs_to :recipe_step
  belongs_to :sub_recipe, class_name: "Recipe", foreign_key: 'sub_recipe_id'

  belongs_to :unit
end
