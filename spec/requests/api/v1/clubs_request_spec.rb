require 'rails_helper'

RSpec.describe "Clubs API" do
  describe "index: 'get /clubs'" do
    describe 'happy path' do
      it 'returns a json object of all clubs' do

        club_1 = club_with_users(users_count: 4)
        club_2 = club_with_users(users_count: 3)
        club_3 = club_with_users(users_count: 6)

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

  describe 'show: get club/:id' do
    describe 'happy path' do
      it 'returns the specified club as a json object' do
        club_1 = club_with_users(users_count: 4)
        get api_v1_club_path(club_1.id)

        expect(response.status).to eq(200)
        club = JSON.parse(response.body, symbolize_names: true)

        expect(club).to have_key(:data)
        expect(club[:data][:id]).to eq(club_1.id.to_s)

        expect(club[:data][:id]).to be_a String
        expect(club[:data][:attributes][:name]).to be_a String
        expect(club[:data][:attributes][:host_id]).to be_an Integer
        expect(club[:data][:attributes][:book_id]).to be_an Integer
      end
    end

    describe 'sad path' do
      it 'returns a 404 status if club is not found' do
        get api_v1_club_path(1)

        no_club = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(404)
      end
    end
  end

end
