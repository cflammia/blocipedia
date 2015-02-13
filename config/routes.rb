Blocipedia::Application.routes.draw do
  get "charges/new"
  get "charges/create"
  devise_for :users
  resources :wikis
  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
