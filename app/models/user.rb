class User < ApplicationRecord
  has_many :recipes
  has_many :steps, through: :recipes

  validates :username, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  has_secure_password

end
