class RecipeShortSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :name, :description, :image_url, :user_id, :scale_factor, :yield_in_grams, :yield, :yield_unit_id, :public
end
