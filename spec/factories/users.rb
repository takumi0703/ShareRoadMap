# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    trait :user1 do
      name { 'username' }
      email { 'test@example.com' }
      password { 'password' }
    end
    trait :already_email do
      name { 'username1' }
      email { 'test@example.com' }
      password { 'password' }
    end
    trait :user2 do
      name { 'username2' }
      email { 'test2@example.com' }
      password { 'password' }
    end
  end
end
