Rails.application.routes.draw do
  get  '/' => "user#new"
  post 'users/create' => "user#create"

  get  'login' => "user#login_form"
  post 'login' => "user#login"
  get  'logout' => "user#destroy"

  get  'users/index' => "user#index"
  get  'users/:id' => "user#show"
  get 'users/:id/edit' => "user#edit"
  post 'users/:id/update' => "user#update"

  get  'road/new' => "road#new"
  get  'road/create' => "road#create"
  get  'road/:id' => "road#show"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
