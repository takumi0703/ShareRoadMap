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
    post 'study/:id/completed_create' => 'study#completed_create', as: 'completed_create'
    post 'study/:id/completed_destroy' => 'study#completed_destroy', as: 'completed_destroy'
    post 'study/:id/update' => 'study#update'
    post 'study/:id/destroy' => 'study#destroy'
    resources :user, only: [:new,:show,:edit]
    resources :study, only: [:new,:edit] do
      resources :like ,only: [:create,:destroy]
      resources :comment ,only: [:new,:create]
    end
    get 'comment/index' => 'comment#index'
    resources :guest_sessions, only: [:create]
  end
