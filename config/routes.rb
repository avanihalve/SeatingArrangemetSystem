Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users

    root to: "employees#index"
    resources :employees 
    resources :homes
    resources :seats
    get '/search', to: "employees#search"

     post '/send_mail', to: 'seats#send_mail'

end
