Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    get 'top/top'
  end

  get '/end_user/mypage'=> 'end_users/end_users#show', as: 'mypage_end_user'

  namespace :admins do
    resources :genres, only:[:index, :edit]
    resources :orders, only:[:index, :new]
    resources :items, only:[:index, :new]
    resources :end_users, only:[:index, :show, :edit, :update]
  end

  namespace :end_users do
    
    resources :cart_items, only:[:index]
    resources :items, only:[:index, :show]
    get 'items/top'

    get 'end_users/confirm'
  end
  
  scope module: :end_users do
    resources :addresses, only:[:create, :edit, :show,:update, :destroy]
    resource :end_user, only:[:index, :edit, :update, :destroy]
  end

 

  root 'end_users/items#top'
  resources :admins, only:[:show, :index, :edit]


  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }


  get '/about' => 'abouts#about', as: 'about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
