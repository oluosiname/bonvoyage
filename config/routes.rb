Rails.application.routes.draw do
  get "login", to: "sessions#login", as: :login
  get "logout", to: "sessions#destroy", as: :logout
  post "login", to: "sessions#create"
  post "/", to: "flights#result"
  root to: "flights#search"

  resources :users, only: [:new, :create] do
  end

  resources :flights do
    collection do
      get "search"
      post "search", to: "flights#result"
      get "result"
      get "all", to: "flights#all"
    end
  end

  resources :bookings, only: [:new, :edit, :update, :create, :destroy] do
    collection do
      get "/", to: "bookings#index"
      get "search", to: "bookings#search"
      post "search", to: "bookings#result"
      post "new", to: "bookings#create"
      get "confirm", to: "bookings#confirm"
      get "success", to: "bookings#success"
    end
  end
end
