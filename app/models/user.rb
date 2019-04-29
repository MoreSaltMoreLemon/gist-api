class User < ApplicationRecord
  has_many :recipes
  has_many :steps, through: :recipes
end
