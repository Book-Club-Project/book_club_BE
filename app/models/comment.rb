class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :club, dependent: :destroy

  validates_presence_of(:title)
  validates_presence_of(:body)
end
