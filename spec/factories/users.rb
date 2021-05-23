# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    trait :user1 do
      name { 'username' }
      sequence(:email) { 'test@example.com' }
      password { 'password' }
    end
    trait :already_name do
      name { 'username' }
      sequence(:email) { 'test1@example.com' }
      password { 'password' }
    end
    trait :already_email do
      name { 'username1' }
      sequence(:email) { 'test@example.com' }
      password { 'password' }
    end
    trait :user2 do
      name { 'username2' }
      sequence(:email) { 'test2@example.com' }
      password { 'password' }
    end
  end
end
