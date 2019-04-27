class RecipeSerializer < ActiveModel::Serializer
  ActiveModelSerializers.config.default_includes = '**'
  attributes :id, :name, :scale_factor, :yield_in_grams, :yield, :yield_unit_id, :public, :steps
  
  belongs_to :user
  has_many :steps

  # def steps
  #   # byebug
  #     StepSerializer.new(object.steps)
  # end
end