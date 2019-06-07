class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :name, :description, :image_url, :user_id, :scale_factor, :yield_in_grams, :yield, :yield_unit_id, :public
  belongs_to :user
  has_many  :recipe_steps

  belongs_to :yield_unit, class_name: 'Unit'
end


