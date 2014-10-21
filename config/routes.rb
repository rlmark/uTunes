Rails.application.routes.draw do

  get "/products/index", to: "products#index"
  get "/merchants/index", to: "merchants#index", as: :merchants_list
  get "/categories_products/index", to: "categories_products#index"
  get "/product/:id", to: "products#show", as: :product

  get "/sessions/new", to: "sessions#new"
  # post "/sessions/new", to: "sessions#new"

  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#delete"


  get "/merchants/new", to: "merchants#new"
  post "/merchants/create/:id", to: "merchants#create"

  get "/ratings/:id/new", to: "ratings#new", as: :new_rating
  post "/rating/create/", to: "ratings#create", as: :ratings

  root "sessions#new"

  # DASHBOARD ROUTES
  get "/dashboard", to: "merchants#dashboard", as: :dashboard
  #
  get "merchant/:id/edit", to: "merchants#edit", as: :edit_merchant
  # Updates the merchant profile info from form
  put "/merchant", to: "merchants#update"

  # Gets the add product page
  get "/products/new", to: "products#new", as: :new_products
  # Adds the newly created product to database
  post "/products/create", to: "products#create", as: :create_products
  # Edits a preexisting product
  get "/products/edit/:id", to: "products#edit", as: :edit_product
  
  delete "/products/delete/:id", to: "products#delete", as: :delete_product
  #singular for form builder thing
  patch "/product/:id", to: "products#update", as: :update_product

  get "/check_out", to: "carts#check_out", as: :check_out
  get "/empty_cart", to: "carts#empty_cart"

  # Links from home page to cart overview
  get "/cart", to: "carts#show", as: :show_cart

  # Add items to cart
  post "/carts/add_item", to: "carts#add_item", as: :add_item

  # resources :product

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
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
