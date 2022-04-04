Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users

  root to: "employees#index"
  resources :employees 
  resources :homes
  resources :seats
  #get '/showall', to: "employees#showall"
  post '/showall', to: "employees#showall"
  get '/search', to: "employees#search"

  post '/send_mail', to: 'employees#send_mail'

end
