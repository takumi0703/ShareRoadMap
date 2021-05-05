FactoryBot.define do
  factory :comment do
    comment_content { "MyString" }
    user { nil }
    study { nil }
  end
end
