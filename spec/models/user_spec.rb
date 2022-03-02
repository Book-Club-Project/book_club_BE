require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'relationships' do
    it { should have_many(:user_clubs) }
    it { should have_many(:clubs).through(:user_clubs) }
    it { should have_many(:comments) }
  end

  describe 'test of password validations' do
    it 'encrypts password' do
      test_user = User.create(username: 'SierraTest', email: 'sierra@test.com', password: 'test12', password_confirmation: 'test12')
      expect(test_user).to_not have_attribute(:password)
      expect(test_user).to_not have_attribute(:password_confirmation)
      expect(test_user.password_digest).to_not eq('test12')
    end
  end

  it 'deletes a user and their  associated comments' do
    user = create(:user, id: 1)
    comment_1 = create(:comment, id: 1, user_id: 1)
    comment_2 = create(:comment, id: 2, user_id: 1)

    user.destroy

    expect(Comment.exists?(comment_1.id)).to eq(false)
    expect(User.exists?(user.id)).to eq(false)
    expect(Comment.exists?(comment_2.id)).to eq(false)
  end
end
