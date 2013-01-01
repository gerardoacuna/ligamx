Ligamx::Application.routes.draw do

  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :teams, only: [:index, :show]
  resources :stocks, only: [:create, :update]
  resources :transactions

  match "market", to: 'teams#index', as: 'market'

  match "admin", to: "admin/teams#index"
  namespace :admin do
    resources :teams
    resources :users
  end

  root to: "portfolio#index"

end
