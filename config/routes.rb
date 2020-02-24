Rails.application.routes.draw do
  root 'items#top'
  get '/end_user/mypage'=> 'end_users#show', as: 'mypage_end_user'
  devise_for :admins
  devise_for :end_users
  resources :admins, only:[:show, :index, :edit]
  resource :end_users, only:[:edit, :confirm, :update]
  resources :items, only:[:index, :show]
  resources :cart_items, only:[:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
