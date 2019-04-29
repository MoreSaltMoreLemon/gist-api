class RecipeShortSerializer < ActiveModel::Serializer
  attributes :id, :name, :color_id

  belongs_to :color
end
