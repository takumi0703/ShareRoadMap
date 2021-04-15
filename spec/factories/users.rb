FactoryBot.define do
  factory :user do
    name {"username"}
    sequence(:email){|n|"test#{n}@example.com"}
    password {"password"}
  end
end
