Blocipedia::Application.routes.draw do
  resources :wikis do
    resources :collaborators, only: [:index, :create, :destroy]
  end

  devise_for :users

  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
