FactoryBot.define do
  factory :study do
    user_id { |n| "1+#{n}" }
    content { |n| "テスト#{n}" }
    material { |n| "テスト#{n}" }
    period { '002021-04-01' }
  end
end
