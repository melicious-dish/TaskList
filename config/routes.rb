Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/tasks', to: 'tasks#index'

  # 1- need to define a route that contians a param. then use the param in the controller
  # :id = this part is a parameter
  get '/tasks/:id', to: 'tasks#show'
end
