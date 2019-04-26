class Recipe < ApplicationRecord
  belongs_to  :user
  has_many    :steps
  has_many    :step_ingredients, through: :steps
  # has_many :users, as: :favorited_users, through: :favorites
end
