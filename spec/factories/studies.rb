FactoryBot.define do
  factory :study do
    user_id { '1' }
    content { 'テスト' }
    material { 'テスト' }
    period { '002021-04-01' }
  end
end
