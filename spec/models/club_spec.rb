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
end
