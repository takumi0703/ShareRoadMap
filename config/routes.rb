Rails
  .application
  .routes
  .draw do
    get 'login' => 'user#login_form'
    post 'login' => 'user#login'
    get 'logout' => 'user#destroy'

    get 'user/index' => 'user#index'
    get '/' => 'user#about'
    post 'user/create' => 'user#create'
    post 'user/:id/update' => 'user#update'
    get 'user/road/:id' => 'user#roadshow'

    post 'study/create' => 'study#create'
    post 'study/:id/update' => 'study#update'
    post 'study/:id/destroy' => 'study#destroy'
    resources :user, only: [:new,:show,:edit]
    resources :study, only: [:new,:edit] do
      resources :like ,only: [:create,:destroy]
    end
    resources :guest_sessions, only: [:create]
  end
