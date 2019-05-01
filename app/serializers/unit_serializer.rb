class UnitSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :name, :gram_conversion_factor
end
