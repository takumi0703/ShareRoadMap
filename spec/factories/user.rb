#サンプルデータを作成する
FactoryBot.define do
    factory :user do
        name {"takumi"} 
        email{"takumi@example.com"}
        password {"takumi"} 
    end
end