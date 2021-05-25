Rails
  .application
  .routes
  .draw do
    get '/' => 'user#new'
    get 'login' => 'user#login_form'
    post 'login' => 'user#login'
    get 'logout' => 'user#destroy'

    get 'user/index' => 'user#index'
    post 'user/create' => 'user#create'
    post 'user/:id/update' => 'user#update'
    get 'user/road/:id' => 'user#roadshow',as:'user_road'

    post 'study/create' => 'study#create'
    get 'study/index' => 'study#index'
    post 'study/:id/completed_create' => 'study#completed_create', as: 'completed_create'
    post 'study/:id/completed_destroy' => 'study#completed_destroy', as: 'completed_destroy'
    post 'study/:id/update' => 'study#update'
    post 'study/:id/destroy' => 'study#destroy'
    resources :user, only: [:new,:show,:edit]
    resources :study, only: [:new,:edit] do
      resources :like ,only: [:create,:destroy]
      resources :comment ,only: [:create]
    end
    get 'comment/index' => 'comment#index'
    get 'comment/:id/new' => 'comment#new',as: 'comment_new'
    get 'comment/:id' => 'comment#show',as: 'comment_show'
    get 'comment/:id/edit' => 'comment#edit',as: 'comment_edit'
    post 'comment/:id/update' => 'comment#update',as: 'comment_update'
    post 'comment/:id/destroy' => 'comment#destroy',as: 'comment_destroy'
    resources :guest_sessions, only: [:create]
  end
