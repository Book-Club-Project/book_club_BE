require 'rails_helper'

RSpec.describe 'comments API' do
  describe 'index: get /comments' do
    describe 'happy path' do
      it 'returns all comments as a json object' do
        club_1 = club_with_comments(comments_count: 5)
        club_2 = club_with_comments(comments_count: 4)

        get api_v1_comments_path
        expect(response.status).to eq(200)
        comments = JSON.parse(response.body, symbolize_names: true)

        expect(comments).to have_key(:data)
        expect(comments[:data].count).to eq(9)

        comments[:data].each do |comment|
          expect(comment[:id]).to be_a String
          expect(comment[:attributes][:title]).to be_a String
          expect(comment[:attributes][:body]).to be_a String
          expect(comment[:attributes][:user_id]).to be_an Integer
          expect(comment[:attributes][:club_id]).to be_an Integer
        end
      end
    end

    describe 'sad path' do
      it 'returns an empty collection when no comments exist' do
        get api_v1_comments_path

        expect(response.status).to eq(200)
        comments = JSON.parse(response.body, symbolize_names: true)

        expect(comments).to have_key(:data)
        expect(comments[:data]).to eq([])
      end
    end
  end

  describe 'create: post /comments' do
    describe 'happy path' do
      it 'returns the new comment as a json object' do
        user = create(:user)
        club = create(:club)
        comment_params = ({
                    title: 'Best book ever',
                    body: 'I thought that ending was fire! Would love to hear opinions!',
                    user_id: user.id,
                    club_id: club.id
                    })
        headers = {"CONTENT_TYPE" => "application/json"}
        post api_v1_comments_path, headers: headers, params: JSON.generate(comment: comment_params)
        created_comment = Comment.last

        expect(response.status).to eq(201)
        expect(created_comment.title).to eq(comment_params[:title])
        expect(created_comment.body).to eq(comment_params[:body])
      end
    end

    describe 'sad paths' do
      it 'returns 400 status if comment cannot be created due to invalid params' do
        user = create(:user)
        club = create(:club)
        comment_params = ({
                    body: 'I thought that ending was fire! Would love to hear opinions!',
                    user_id: user.id,
                    club_id: club.id
                    })
        headers = {"CONTENT_TYPE" => "application/json"}
        post api_v1_comments_path, headers: headers, params: JSON.generate(comment: comment_params)

        expect(response.status).to eq(400)
      end

      it 'ignores attributes that are not permitted' do
        user = create(:user)
        club = create(:club)
        comment_params = ({
                    title: 'Best book ever!',
                    body: 'I thought that ending was fire! Would love to hear opinions!',
                    user_id: user.id,
                    club_id: club.id,
                    non_permitted_attribute: 'woohooo'
                    })
        headers = {"CONTENT_TYPE" => "application/json"}
        post api_v1_comments_path, headers: headers, params: JSON.generate(comment: comment_params)
        comment = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(201)
        expect(comment[:data][:attributes]).to_not have_key(:non_permitted_attribute)
      end
    end
  end

  describe 'deletes comments' do
    describe 'happy path' do
      it 'deletes comments' do
        club_1 = club_with_comments(comments_count: 5)
        comments = JSON.parse(response.body, symbolize_names: true)
  
        delete api_v1_comments_path

      end
    end

    describe 'sad path' do
    end
  end
end
