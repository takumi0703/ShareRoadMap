#サンプルデータを作成する
FactoryBot.define do
    factory :user do
        name {"name"} 
        email{"a@example.com"}
        password {"password"} 
    end
end