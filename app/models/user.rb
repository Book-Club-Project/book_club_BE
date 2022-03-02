class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_presence_of :username
  validates_uniqueness_of :username

  has_secure_password(validations: false)

  has_many :user_clubs
  has_many :clubs, through: :user_clubs
  has_many :comments
end
