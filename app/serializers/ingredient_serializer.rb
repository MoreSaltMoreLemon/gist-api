class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :recipe_id, :is_recipe, :default_color
end
