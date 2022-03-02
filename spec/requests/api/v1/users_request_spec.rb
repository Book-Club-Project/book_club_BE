require 'rails_helper'

describe "Users API" do
  describe 'index: get /users' do
    describe 'happy path' do
      it 'returns a json object of all users' do
        create_list(:user, 3)

        get api_v1_users_path

        expect(response.status).to eq(200)
        users = JSON.parse(response.body, symbolize_names: true)

        expect(users).to have_key(:data)
        expect(users[:data].count).to eq(3)

        users[:data].each do |user|
          expect(user[:id]).to be_a String
          expect(user[:attributes][:username]).to be_a String
          expect(user[:attributes][:email]).to be_a String
        end
      end
    end

    describe 'sad path' do
      it 'returns an empty collection when no items exist' do
        get api_v1_users_path

        expect(response.status).to eq(200)
        no_users = JSON.parse(response.body, symbolize_names: true)

        expect(User.count).to eq(0)
        expect(no_users[:data]).to eq([])
      end
    end
  end

  describe 'show: get /users/:id' do
    describe 'happy path' do
      it 'returns a single json object of the specified user' do
        create(:user, id: 1)
        get api_v1_user_path(1)

        expect(response.status).to eq(200)
        user = JSON.parse(response.body, symbolize_names: true)

        expect(user).to have_key(:data)
        expect(user[:data].count).to eq(3)

        expect(user[:data][:id]).to be_a String
        expect(user[:data][:attributes][:username]).to be_a String
        expect(user[:data][:attributes][:email]).to be_a String
      end
    end

    describe 'sad path' do
      it 'returns a 404 status if item is not found' do
        create(:user, id: 1)
        get api_v1_user_path(2)

        no_user = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)

        expect(no_user).to have_key(:error)
        expect(no_user[:error][:exception]).to eq("Couldn't find User with 'id'=2")
      end
    end
  end

  describe 'create' do
    describe 'happy path' do
      it 'returns the new user as a json object' do
        user_params = ({
                    username: 'test1',
                    email: 'test@email.com'
                    })
        headers = {"CONTENT_TYPE" => "application/json"}
        post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)
        created_user = User.last

        expect(response.status).to eq(201)
        expect(created_user.username).to eq(user_params[:username])
        expect(created_user.email).to eq(user_params[:email])
      end
    end

    describe 'sad path' do
      it 'does not create a new user and sends error' do
        user_params = ({
                    username: 'test1'
                    })
        headers = {"CONTENT_TYPE" => "application/json"}
        post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)

        expect(response.status).to eq(400)
      end

      it 'ignores attributes that are not permitted' do
        user_params = ({
                  username: 'test1',
                  email: 'test@email.com',
                  non_permitted_attribute: 'wooooohoooo'
                })
        headers = {"CONTENT_TYPE" => "application/json"}
        post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)
        user = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(201)
        expect(user[:data][:attributes]).to_not have_key(:non_permitted_attribute)
      end
    end
  end

  describe 'get clubs' do
    describe 'happy path' do
      it 'returns the clubs associated with the specified user as a json object' do
        user_1 = create(:user, id: 1)
        club_1 = create(:club)
        club_2 = create(:club)
        user_1.clubs << club_1
        user_1.clubs << club_2

        get api_v1_user_clubs_path(1)

        clubs = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(clubs).to have_key(:data)
        expect(clubs[:data].count).to eq(2)

        clubs[:data].each do |club|
          expect(club[:id]).to be_a String
          expect(club).to have_key(:attributes)
          expect(club[:attributes][:name]).to be_a String
          expect(club[:attributes][:host_id]).to be_an Integer
          expect(club[:attributes][:book_id]).to be_an Integer
        end
      end
    end

    describe 'sad path' do
      it 'returns a 404 error if the user does not exist' do
        get api_v1_user_clubs_path(1)

        result = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
      end
    end
  end

  describe 'update a user' do
    describe 'happy path' do
      it 'updates a user' do
        user_id = create(:user, id: 1).id
        previous_username = User.last.username
        user_params = { username: "Reads_at_a_5th_grade_Level" }
        headers = {"CONTENT_TYPE" => "application/json"}
        patch api_v1_user_path(1), headers: headers, params: JSON.generate({user: user_params})
        user = User.find_by(id: user_id)
        expect(response.status).to eq(200)
        expect(user.username).to eq("Reads_at_a_5th_grade_Level")
        expect(user.username).to_not eq(previous_username)
        expect(user.email).to eq(User.last.email)
      end
    end

    describe 'sad path' do
      it 'cannot update a user if no updated params are given' do
        user_id = create(:user, id: 1).id
        username = User.last.username
        headers = {"CONTENT_TYPE" => "application/json"}
        patch api_v1_user_path(1), headers: headers, params: JSON.generate({user: { username: User.last.username }})
        user = User.find_by(id: user_id)
        expect(user.username).to eq(username)
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'deletes a user' do
    it "finds a user by id and deletes them" do
      user_1 = create(:user, id: 1)

      delete api_v1_user_path(1)

      expect(response.status).to eq(204)
      expect(response.body).to be_empty
    end

    it "finds a user by id and deletes them" do
      user_1 = create(:user, id: 1)

      delete api_v1_user_path(666)

      expect(response.status).to eq(404)
    end
  end
end
