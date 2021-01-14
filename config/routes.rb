Rails.application.routes.draw do
  get 'persons/profile', as: 'user_root'
  devise_for :users
  resources :projects do
    resources :tasks, shallow: true
  end
  root 'persons#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
