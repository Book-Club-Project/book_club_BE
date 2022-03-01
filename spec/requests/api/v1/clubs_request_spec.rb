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

  describe 'create: post /clubs' do
    describe 'happy path' do
      it 'returns the new club as a json object' do
        user = create(:user)
        club_params = ({name: 'Sherlock Homies',
                        host_id: user.id,
                        book_id: 9999})
        headers = {"CONTENT_TYPE" => "application/json"}
        post api_v1_clubs_path, headers: headers, params: JSON.generate(club: club_params)
        created_club = Club.last

        expect(response.status).to eq(201)
        expect(created_club.name).to eq(club_params[:name])
        expect(created_club.host_id).to eq(club_params[:host_id])
        expect(created_club.book_id).to eq(club_params[:book_id])
      end
    end

    describe 'sad paths' do
      it 'does not create the new club if any attributes are missing and returns invalid error' do
        club_params = ({name: 'Sherlock Homies',
                        book_id: 9999})
        headers = {"CONTENT_TYPE" => "application/json"}
        post api_v1_clubs_path, headers: headers, params: JSON.generate(club: club_params)

        expect(response.status).to eq(400)
      end

      it 'ignores non-permitted attributes' do
        user = create(:user)
        club_params = ({name: 'Sherlock Homies',
                        host_id: user.id,
                        book_id: 9999,
                        non_permitted_attribute: 'wooohooooo'})
        headers = {"CONTENT_TYPE" => "application/json"}
        post api_v1_clubs_path, headers: headers, params: JSON.generate(club: club_params)
        created_club = Club.last
        club = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(201)
        expect(created_club.name).to eq(club_params[:name])
        expect(club[:data][:attributes]).to_not have_key(:non_permitted_attribute)
      end
    end
  end

  describe 'get club users' do
    describe 'happy path' do
      it 'returns all users involved in a club as a json object' do
        club_1 = club_with_users(users_count: 4)
        club_2 = club_with_users(users_count: 3)
        club_3 = club_with_users(users_count: 6)

        get api_v1_club_users_path(club_1.id)

        users = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(users).to have_key(:data)

        expect(users[:data].count).to eq(4)
        users[:data].each do |user|
          expect(user[:attributes][:username]).to be_a String
          expect(user[:attributes][:email]).to be_a String
        end
      end

      describe 'sad path' do
        it 'returns a 404 error if the club is not found' do
          get api_v1_club_users_path(1)

          result = JSON.parse(response.body, symbolize_names: true)

          expect(response.status).to eq(404)
          expect(result[:error][:exception]).to eq("Couldn't find Club with 'id'=1")
        end
      end
    end

    describe 'get club comments' do
      describe 'happy path' do
        it 'returns a json object of all comments associated with a club' do
          club_1 = club_with_comments(comments_count: 5)
          club_2 = club_with_comments(comments_count: 4)

          get api_v1_club_comments_path(club_2.id)
          expect(response.status).to eq(200)
          comments = JSON.parse(response.body, symbolize_names: true)

          expect(comments).to have_key(:data)
          expect(comments[:data].count).to eq(4)

          comments[:data].each do |comment|
            expect(comment[:id]).to be_a String
            expect(comment[:attributes][:title]).to be_a String
            expect(comment[:attributes][:body]).to be_a String
            expect(comment[:attributes][:user_id]).to be_an Integer
            expect(comment[:attributes][:club_id]).to be_an Integer
          end
        end

        describe 'sad path' do
          it 'returns a 404 error if club is not found' do
            get api_v1_club_comments_path(1)

            expect(response.status).to eq(404)

            result = JSON.parse(response.body, symbolize_names: true)
            expect(result[:error][:exception]).to eq("Couldn't find Club with 'id'=1")
          end
        end
      end
    end

    describe 'destroy: delete /club' do
      it 'deletes a book club' do
        club = create :club
        delete "/api/v1/clubs/#{club.id}"
        expect(response).to be_successful, status: 204
        expect(response.body).to be_empty 
      end
    end
  end
end
