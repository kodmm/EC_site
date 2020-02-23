Rails.application.routes.draw do
  root 'items#top'
  devise_for :admins
  devise_for :end_users
  resources :admins, only:[:show, :index, :edit]
  resources :end_users, only:[:show, :edit, :confirm]
  resources :items, only:[:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
