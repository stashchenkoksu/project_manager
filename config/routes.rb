Rails.application.routes.draw do
  root 'projects#index'

  devise_for :users
  resources :projects do
    resources :tasks, shallow: true
  end
  resources :users
  get 'user/registration_update', to: 'devise/registrations#update', as: "user_reg"
  #get 'users/profile', as: 'user_profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
