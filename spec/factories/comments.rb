FactoryBot.define do
    factory :comment do
        comment_content {'test'}
        user_id {'1'}
        study_id {'1'}
    end
end
