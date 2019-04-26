class UserProfileSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :bio

  belongs_to :user
end