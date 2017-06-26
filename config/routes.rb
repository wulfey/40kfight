Rails.application.routes.draw do


  resources :weapons
  resources :simulations
    root 'pages#index'

    resources :fourth_weapons
    resources :third_weapons
    resources :second_weapons
    resources :first_weapons
    resources :datasheets
    resources :units
    resources :valid_detachments
    resources :detachments
    resources :lists
    devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
