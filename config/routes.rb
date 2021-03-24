Rails.application.routes.draw do
  #ユーザー登録
  get '/' => "user#new"
  post 'users/create' => "user#create"
  #ログイン
  get 'login' => "user#login"
  #ユーザー詳細ページ
  get 'users/:id' => "user#show"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
