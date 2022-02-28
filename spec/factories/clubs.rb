FactoryBot.define do
  factory :club do
    name { Faker::Team.name }
    host_id { Faker::Number.between(from: 1, to: 500) }
    book_id { Faker::Number.between(from: 5, to: 8000) }
  end
end

def club_with_users(users_count: 3)
  FactoryBot.create(:club) do |club|
    FactoryBot.create_list(:user, users_count, clubs: [club])
  end
end
