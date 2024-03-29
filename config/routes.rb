Ligamx::Application.routes.draw do

  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :teams, only: [:index, :show]
  resources :stocks, only: [:create, :update]
  resources :transactions do
    collection { post :accept_bid }
  end
  resources :rankings, only: :index
  resources :schedules, only: [:index, :show]
  resources :bids

  match "portfolio", to: 'portfolio#index', as: 'portfolio'
  match "market", to: 'teams#index', as: 'market'

  match "admin", to: "admin/teams#index"
  namespace :admin do
    resources :teams
    resources :users
    resources :announcements
    resources :stocks
    resources :schedules
  end

  root to: "home#index"

end
