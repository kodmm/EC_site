Rails.application.routes.draw do
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
  scope :admins do
    resources :items, only:[:index, :show]
  end

  scope :end_users do
    resources :items, only:[:index, :show]

  end

  resource :end_user, only:[:edit, :confirm, :update]
  root 'items#top'

  get '/end_user/mypage'=> 'end_users#show', as: 'mypage_end_user'
  get '/about' => 'abouts#about', as: 'about'
  resources :admins, only:[:show, :index, :edit]
  resources :cart_items, only:[:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
