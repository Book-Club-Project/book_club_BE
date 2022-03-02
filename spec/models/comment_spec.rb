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

  it 'deletes a comment without deleting a user' do
    user = create(:user, id: 1)
    comment_1 = create(:comment, id: 1, user_id: 1)
    comment_2 = create(:comment, id: 2, user_id: 1)

    comment_1.destroy

    expect(Comment.exists?(comment_1.id)).to eq(false)
    expect(User.exists?(user.id)).to eq(true)
    expect(Comment.exists?(comment_2.id)).to eq(true)
  end
end
