FactoryBot.define do
  factory :study do
    user_id { '1' }
    content { '学習内容' }
    material { '学習教材' }
    period { '002021-04-01' }
  end
end
