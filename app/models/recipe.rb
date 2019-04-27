class Recipe < ApplicationRecord
  belongs_to  :user
  has_many    :steps
  has_many    :step_ingredients, through: :steps

  accepts_nested_attributes_for :steps, allow_destroy: true
  # has_many :users, as: :favorited_users, through: :favorites
end
