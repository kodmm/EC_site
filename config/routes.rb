Rails.application.routes.draw do
  get 'admins/index'
  get 'admins/show'
  get 'admins/edit'
  get 'end_users/show'
  get 'end_users/edit'
  get 'end_users/confirm'
  devise_for :admins
  devise_for :end_users
  get 'items/index'
  get 'items/top'
  get 'items/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
