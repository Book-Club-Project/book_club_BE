require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:club) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:body)}
  end

  describe "class methods" do
    it 'returns comments in created by order' do
      club_1 = create(:club)
      user_1 = create(:user, id: 1)
      user_2 = create(:user, id: 2)
      user_3 = create(:user, id: 3)
      comment_1 = user_1.comments.create(:comment)
      comment_3 = user_3.comments.create(:comment)
      comment_2 = user_2.comments.create(:comment)

      expect(comment_3.body).to appear_before(comment_2.body)
    end
  end
end
