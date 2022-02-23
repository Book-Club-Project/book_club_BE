require 'rails_helper'

RSpec.describe UserClub do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:club) }
  end
end 
