Rails.application.routes.draw do
  get  '/' => "user#new"
  get  '/about' => "user#about"
  post 'users/create' => "user#create"
  
  get  'login' => "user#login_form"
  post 'login' => "user#login"
  get  'logout' => "user#destroy"
  
  get  'users/index' => "user#index"
  get  'users/:id' ,to: "user#show"
  get 'users/:id/edit' => "user#edit"
  post 'users/:id/update' => "user#update"
  #ロードマップ詳細
  get 'users/road/:id' => "user#roadshow"
  #学習
  get 'study/new' => "study#new"
  post 'study/create' => "study#create"
  get 'study/:id/edit' => "study#edit"
  post 'study/:id/update' => "study#update"
  post 'study/:id/destroy' => "study#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
