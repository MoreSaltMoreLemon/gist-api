class User < ApplicationRecord
  has_one :user_profile
  has_many :recipes
  has_many :steps, through: :recipes
  has_many :units, through: :recipes
  # has_many :favorites
  # has_many :recipes, as: :favourite_recipes, through: :favorites
end
