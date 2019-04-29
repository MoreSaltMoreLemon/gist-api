class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_id, :scale_factor, :yield_in_grams, :yield, :yield_unit_id, :public, :color_id
  # byebug
  belongs_to :user
  has_many  :recipe_ingredients
  has_many  :recipe_sub_recipes

  belongs_to :color
  belongs_to :yield_unit, class_name: 'Unit'
end


