Rails.application.routes.draw do
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  #   resources :products
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

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get '
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
