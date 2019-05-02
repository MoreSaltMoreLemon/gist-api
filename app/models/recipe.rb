class Recipe < ApplicationRecord
  belongs_to :user
  has_many  :recipe_steps
  has_many  :step_ingredients, through: :recipe_steps
  has_many  :step_sub_recipes, through: :recipe_steps

  belongs_to :yield_unit, class_name: 'Unit'
  # not currently working. If called by the parent, returns itself
  # if called by the child, returns nothing
  # has_many  :super_recipes, through: :recipe_sub_recipes, source: :recipe

  accepts_nested_attributes_for :recipe_steps

  def next_sequence_order
    # byebug
    if self.recipe_steps.empty?
      0
    else
      recipe_step_sequence_order = self.recipe_steps.max_by {|rs| rs.sequence_order}.sequence_order
      recipe_step_sequence_order + 1
    end
  end
end
