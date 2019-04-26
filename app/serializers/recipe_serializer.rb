class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :scale_factor, :yield_in_grams, :yield, :yield_unit_id, :public

  belongs_to :user
end