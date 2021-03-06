Rails.application.routes.draw do



    resources :battles
    root 'pages#index'
    devise_for :users
    resources :messages
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'

    resources :weapons
    resources :simulations
    get   '/simulations/:id/units/:unit_id',   to: 'simulations#change_unit'
    get   '/simulations/:id/datasheets/:datasheet_id',   to: 'simulations#change_datasheet'

    get   '/battles/:id/datasheet/:datasheet_id/:team',   to: 'battles#change_unit'
    get   '/battles/:id/unit/:unit_id',   to: 'battles#remove_unit'
    post   '/battles/:id',   to: 'battles#add_simulation'
    delete '/battles/:id/simulations/:sim_id',   to: 'battles#destroy_simulation', as: 'delete_sim_from_battle'

    post '/messages/:user_id',   to: 'messages#clear_messages', as: 'clear_messages'

    # post  '/battles/:id/unit/:unit_id',   to: 'battles#remove_unit'


    post   '/simulations/:id/any_attack', to: 'simulations#any_attack', as: 'any_attack'


    resources :datasheets
    resources :units
    resources :valid_detachments
    resources :detachments
    resources :lists


    mount ActionCable.server, at: '/cable'

    # devise_scope :user do
    #     get 'login', to: 'devise/sessions#new'
    # end
    # devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
