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
end
