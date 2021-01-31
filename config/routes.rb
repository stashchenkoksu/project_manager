Rails.application.routes.draw do
  root 'projects#index'

  devise_for :users
  resources :projects do
    resources :tasks, shallow: true do
      resources :comments
    end
    resources :comments
  end
  resources :comments do
    resources :comments
  end
  resources :users
  resources :teams

  #get ' /comments/:id(.:format)', to: 'tasks/comments', as: 'task_comment'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
