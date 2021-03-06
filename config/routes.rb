Rails.application.routes.draw do

  get "/products/index", to: "products#index"
  get "/merchants/index", to: "merchants#index", as: :merchants_list
  get "/categories_products/index", to: "categories_products#index"
  get "/product/:id", to: "products#show", as: :product

  get "/sessions/new", to: "sessions#new"
  # post "/sessions/new", to: "sessions#new"
  get "/sessions/signin", to: "sessions#signin"

  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#delete"

  get "/merchants/new", to: "merchants#new", as: :new_merchant
  post "/merchants/create", to: "merchants#create"

  get "/ratings/:id/new", to: "ratings#new", as: :new_rating
  post "/rating/create", to: "ratings#create", as: :ratings

  root "sessions#new"

  # DASHBOARD ROUTES
  # Displays entire dashboard page
  get "/dashboard", to: "merchants#dashboard", as: :dashboard
  # Takes you to the order summary page
  get "/orders", to: "merchants#orders", as: :orders
  # Takes you to order shipment page
  get "/orders/:id", to: "merchants#ship", as: :ship_order
  # Chanes status of products upon shipment
  patch "/orders/:id", to: "merchants#change_status", as: :change_status

  # Takes you to the edit merchant form
  get "merchant/:id/edit", to: "merchants#edit", as: :edit_merchant ####### fixing edit merchant
  # Updates the merchant profile info from form
  put "/merchant", to: "merchants#update"
  # Gets the "add a new product" page
  get "/products/new", to: "products#new", as: :new_products
  # Adds the newly created product to database
  post "/products/create", to: "products#create", as: :create_products
  # Edits a preexisting product
  get "/products/edit/:id", to: "products#edit", as: :edit_product
  # Delete category from product description
  get "/products/delete_category", to: "products#delete_category", as: :delete_category

  get "/categories/new", to: "categories#new", as: :new_categories
  post "/category/create", to: "categories#create", as: :categories

  get "/categories_products/new/:id", to: "categories_products#new", as: :add_category
  post "/categories_product/create", to: "categories_products#create", as: :categories_products
  post "/categories_products/update", to: "categories_products#update", as: :categories_products_update # use this to make new things on your join table

  delete "/products/delete/:id", to: "products#delete", as: :delete_product
  #singular for form builder thing
  patch "/product/:id", to: "products#update", as: :update_product

  get "/check_out", to: "carts#check_out", as: :check_out
  delete "/empty_cart", to: "carts#empty_cart", as: :empty_cart

  # Links from home page to cart overview
  get "/cart", to: "carts#show", as: :show_cart

  # Add items to cart
  post "/carts/add_item", to: "carts#add_item", as: :add_item

  # Change quantity of ordered item on show cart page
  patch "/ordered_item/:id", to: "ordered_items#update_quantity", as: :ordered_item

  # Enter customer information in cart record
  patch "/carts/:id", to: "carts#cart", as: :cart

  # Display all ordere information
  get "/carts/confirmation", to: "carts#confirmation", as: :confirmation

  # Delete an item from a cart
  delete "/ordered_item/:id", to: "ordered_items#delete_ordered_item", as: :delete_ordered_item


  # Complete Purchase after customer has reviewed all information
  get "/carts/complete_order", to: "carts#complete_order", as: :complete_order

  # All done tell the customer they are done
  get "/carts/final_page", to: "carts#final_page", as: :final_page

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
