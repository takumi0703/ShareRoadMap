FactoryBot.define do
  factory :comment do
    user_id         { "1" }
    study_id        { '1' }
    comment_content { 'テストコメント'}
  end
end
