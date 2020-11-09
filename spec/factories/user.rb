FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {"123123123"}
    password_confirmation {"123123123"}
  end
end
