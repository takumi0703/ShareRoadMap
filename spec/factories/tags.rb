FactoryBot.define do
  factory :tag do
    tag_name { "rails" }
    trait :Tag do
      tag_name { "Rails" }
    end
    trait :tag_list do
      tag_name { "rails ruby" }
    end
  end
end
