class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :scale_factor, :yield_in_grams, :yield, :yield_unit_id, :public
  byebug
  belongs_to :user
  has_many  :recipe_ingredients
  # has_many  :recipe_sub_recipes
end


