ParkingClub::Application.routes.draw do
  root "welcome#index"

  resources :users do
    collection do
      get :new_owner
    end
  end

  resources :lots


end
