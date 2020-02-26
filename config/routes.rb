Rails.application.routes.draw do
  namespace :admins do
    get 'top/top'
  end

  namespace :admins do
    resources :genres, only:[:index, :edit]
    resources :orders, only:[:index, :new]
    resources :items, only:[:index, :new]
    resources :end_users, only:[:index, :show]
  end
  namespace :end_users do
    resource :cart_items, only:[:index]
    resources :items, only:[:index, :show]
    get 'items/top'
    resources :end_users, only:[:show, :edit]
    get 'end_users/confirm'
  end

  root 'items#top'
  resources :admins, only:[:show, :index, :edit]
  resource :end_user, only:[:edit, :confirm, :update]

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }

  


  get '/end_user/mypage'=> 'end_users#show', as: 'mypage_end_user'
  get '/about' => 'abouts#about', as: 'about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
