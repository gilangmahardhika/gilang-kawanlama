FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Artist.name }
    password { Faker::Internet.password }
    role { "Admin" }
  end
end
