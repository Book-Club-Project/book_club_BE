FactoryBot.define do
  factory :comment do
    title { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
    association :user
    association :club
  end
end

def club_with_comments(comments_count: 5)
  FactoryBot.create(:club) do |club|
    FactoryBot.create_list(:comment, comments_count, club: club)
  end
end
