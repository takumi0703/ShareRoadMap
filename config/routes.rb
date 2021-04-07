Rails.application.routes.draw do
  get  'user/index' => "user#index"
  resources :user, only: [:new, :show,:edit]
  resources :study, only: [:new,:edit]
  get  '/' => "user#about"
  post 'user/create' => "user#create"
  
  get  'login' => "user#login_form"
  post 'login' => "user#login"
  get  'logout' => "user#destroy"
  post 'user/:id/update' => "user#update"
  get 'user/road/:id' => "user#roadshow"

  post 'study/create' => "study#create"
  post 'study/:id/update' => "study#update"
  post 'study/:id/destroy' => "study#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
