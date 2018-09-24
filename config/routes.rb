Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tasks#index'
  # get '/tasks', to: 'tasks#index' #entire collection
  #
  # # 1- need to define a route that contians a param. then use the param in the controller
  # get '/tasks/new', to: 'tasks#new', as: 'new_task' #entire collection
  # post '/tasks', to: 'tasks#create' #collection
  #
  # # following are paramaterized/ individual ones
  # #   :id = this part is a parameter
  #
  # get '/tasks/:id', to: 'tasks#show', as: 'task' # nickname for url
  # get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#mark_complete', as: 'mark_complete'
  # patch '/tasks/:id', to: 'tasks#update'
  # delete '/tasks/:id', to: 'tasks#destroy'

  # all can  be replaced with except root
  # can be restricted if needed
  # don't generate routes you're not using

  resources :tasks

end
