class Club < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :book_id
  validates_presence_of :host_id

  has_many :user_clubs
  has_many :users, through: :user_clubs
  has_many :comments
end
