Rails.application.routes.draw do
  get '/' => "user#signup"
  get 'login' => "user#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
