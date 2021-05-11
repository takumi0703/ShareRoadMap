FactoryBot.define do
  factory :study do
    user_id { '1' }
    content { 'test-content' }
    material { 'test-material' }
    period { '0000-00-00' }
  end
end
