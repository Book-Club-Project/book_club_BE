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
end
