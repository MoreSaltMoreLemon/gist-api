class RecipeStep < ApplicationRecord
  belongs_to  :recipe
  has_many    :step_ingredients
  has_many    :ingredients, through: :step_ingredients
  has_many    :step_sub_recipes
  has_many    :sub_recipes, through: :step_sub_recipes, class_name: 'Recipe'

  def next_sequence_order
    if self.step_ingredients.empty? && self.step_sub_recipes.empty?
      0
    elsif self.step_sub_recipes.empty?
      self.step_ingredients.max_by {|ri| ri.sequence_order}.sequence_order + 1
    elsif self.step_ingredients.empty?
      self.step_sub_recipes.max_by {|ri| ri.sequence_order}.sequence_order + 1
    else
      sub_recipe_sequence_order = self.step_sub_recipes.max_by {|ri| ri.sequence_order}.sequence_order
      ingredient_sequence_order = self.step_ingredients.max_by {|ri| ri.sequence_order}.sequence_order
      sub_recipe_sequence_order > ingredient_sequence_order ? sub_recipe_sequence_order + 1 : ingredient_sequence_order + 1
    end
  end

end
