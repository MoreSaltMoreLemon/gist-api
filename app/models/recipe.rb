class Recipe < ApplicationRecord
  belongs_to :user
  # has_many :users, as: :favorited_users, through: :favorites
end
