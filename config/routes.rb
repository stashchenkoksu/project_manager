Rails.application.routes.draw do
  root 'projects#index'

  devise_for :users
  resources :projects do
    resources :tasks, shallow: true do
      resources :comments, except: [:index]
    end
    resources :comments, except: [:index]
  end
  resources :comments, except: [:index] do
    resources :comments, except: [:index]
  end
  resources :users
  resources :teams
  get '/admin', to: 'admin_page#admin'
  get '/admin/project', to: 'admin_page#project_page', as: 'admin_projects'
  get '/admin/statistic_user/:id(.:format)', to:'admin_page#user_statistic', as: 'admin_user_statistic'
  get '/admin/statistic_project/:id(.:format)', to:'admin_page#project_statistic', as: 'admin_project_statistic'

  #get ' /comments/:id(.:format)', to: 'tasks/comments', as: 'task_comment'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
