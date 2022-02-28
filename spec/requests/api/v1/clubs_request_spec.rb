require 'rails_helper'

RSpec.describe "Clubs API" do
  describe "index: 'get /clubs'" do
    describe 'happy path' do
      it 'returns a json object of all clubs' do
        user_1 = club_with_users(users_count: 4)
        user_2 = club_with_users(users_count: 3)
        user_3 = club_with_users(users_count: 6)

        get api_v1_clubs_path

        expect(response.status).to eq(200)
        clubs = JSON.parse(response.body, symbolize_names: true)

        expect(clubs).to have_key(:data)
        expect(clubs[:data].count).to eq(3)

        clubs[:data].each do |club|
          expect(club[:id]).to be_a String
          expect(club[:attributes][:name]).to be_a String
          expect(club[:attributes][:host_id]).to be_an Integer
          expect(club[:attributes][:book_id]).to be_an Integer
        end
      end
    end

    describe 'sad path' do
      it 'returns an empty collection when no clubs exist' do
        get api_v1_clubs_path

        expect(response.status).to eq(200)
        no_clubs = JSON.parse(response.body, symbolize_names: true)

        expect(Club.count).to eq(0)
        expect(no_clubs).to have_key(:data)
        expect(no_clubs[:data]).to eq([])
      end
    end
  end
end
