Rails.application.routes.draw do
  get  '/' => "user#new"
  post 'users/create' => "user#create"
  get  'login' => "user#login_form"
  post 'login' => "user#login"
  get  'users/:id' => "user#show"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
