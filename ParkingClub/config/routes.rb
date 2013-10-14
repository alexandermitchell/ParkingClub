ParkingClub::Application.routes.draw do
  root "welcome#index"

  resources :users do
    collection do
      get :new_owner
    end
  end

  resources :lots do
    resources :memberships
  end

  resources :sessions, only: [:new, :create, :destroy]

  delete "logout" => "sessions#destroy", as: "logout"

  get "login" => "sessions#new", as: "login"


end
