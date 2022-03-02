class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :club

  validates_presence_of(:title)
  validates_presence_of(:body)
end
