# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'username1' }
    sequence(:email) { |n| "test1#{n}@example.com" }
    password { 'password' }
  end
end
