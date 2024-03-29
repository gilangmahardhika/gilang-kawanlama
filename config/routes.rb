Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  post "sign_in", to: "authentications#sign_in", as: :sign_in
  delete "sign_out", to: "authentications#sign_out", as: :sign_out

  resources :products
  resources :users
  resources :exports, only: [:index, :create] do
    member do
      post :download
    end
  end
end
