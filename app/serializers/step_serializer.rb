class StepSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :sequence_order, :name, :yield_in_grams, :yield, :yield_unit_id, :prep_time_minutes, :post_prep_time_minutes

  belongs_to  :recipe
  has_many    :step_ingredients
end