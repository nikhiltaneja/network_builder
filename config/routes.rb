NetworkBuilder::Application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  root 'users#index'

  resources :users
  resources :matches, only: [ :create, :update ] do
    collection do
      get :require_responses
      get :completed
      get :outstanding_requests
    end
  end

end
