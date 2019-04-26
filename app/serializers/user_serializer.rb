class UserSerializer < ActiveModel::Serializer
  attributes :id, :username

  # has_one :user_profile
  has_many :recipes
end