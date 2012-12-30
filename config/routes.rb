Ligamx::Application.routes.draw do

  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :teams, only: [:index, :show]
  resources :users
  resources :stocks, only: :create

  namespace :admin do
    resources :teams
    resources :users
  end

  root :to => "portfolio#index"

end
