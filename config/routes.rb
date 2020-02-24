Rails.application.routes.draw do
  get 'cart_items/index'
  root 'items#top'
  get '/end_user/mypage'=> 'end_users#show', as: 'mypage_end_user'
  devise_for :admins
  devise_for :end_users
  resources :admins, only:[:show, :index, :edit]
  resource :end_users, only:[:edit, :confirm, :update]
  resources :items, only:[:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
