Rails.application.routes.draw do
  root 'projects#index'
  get 'persons/profile', as: 'user_root'
  devise_for :users
  resources :projects do
    resources :tasks, shallow: true
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
