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
end
