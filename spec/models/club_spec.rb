require 'rails_helper'

RSpec.describe Club do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:book_id) }
    it { should validate_presence_of(:host_id) }
  end

  describe 'relationships' do
    it { should have_many(:user_clubs)}
    it { should have_many(:users).through(:user_clubs)}
    it { should have_many(:comments)}
  end

  it 'deletes a club and associated comments' do
    club = create(:club, id: 1)
    comment_1 = create(:comment, id: 1, club_id: 1)
    comment_2 = create(:comment, id: 2, club_id: 1)

    club.destroy

    expect(Comment.exists?(comment_1.id)).to eq(false)
    expect(Club.exists?(club.id)).to eq(false)
    expect(Comment.exists?(comment_2.id)).to eq(false)
  end
end
