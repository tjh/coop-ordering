FryFarmsCoop::Application.routes.draw do

  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end


  resources :pages, :only => [:index, :show]
  resources :orders

  match 'user_root', :to => "pages#show", :id => 'dashboard'

  namespace :admin do
    root :to => 'users#index'
    resources :users
    resources :vendors do
      resources :categories, :only => [:new]
    end
    resources :categories, :except => [:new, :index] do
      resources :items, :only => [:new]
    end
    resources :items, :except => [:index]
    resources :batches do
      match 'orders', :to => 'orders#index'
    end
    resources :orders, :only => [:show]
  end

  namespace :member do
    resources :orders
  end

  root :to => 'pages#index'
end
