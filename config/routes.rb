Rails.application.routes.draw do
  #ユーザー登録・ログイン
  get '/' => "user#signup"
  get 'login' => "user#login"
  #ユーザー詳細ページ
  get 'users/show' => "user#show"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
