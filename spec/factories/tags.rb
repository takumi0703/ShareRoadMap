FactoryBot.define do
  factory :tag do
    tag_name { 'rails' }
    trait :tag_list do
      tag_name { 'rails ruby' }
    end
  end
end
