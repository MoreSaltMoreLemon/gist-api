class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :ingredient_id, :quantity, :unit_id, :instruction, :yield, :yield_unit_id
end
