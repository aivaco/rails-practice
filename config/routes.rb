Rails.application.routes.draw do
  
  resources :appointments do
    member do
      get 'singular'
    end
    collection do
      get 'getlist'
    end

  end
  
  devise_scope :user do
    get 'users/index', to:'users/employees#index', as:'employees'
    get 'users/new_user', to: 'users/employees#new_user', as: 'new_employee'
    post 'users/create_user/', to: 'users/employees#create_user', as: 'create_employee'
    get 'users/edit_user/:id', to: 'users/employees#edit_user', as: 'edit_employee'
    patch 'users/update_user/:id', to: 'users/employees#update_user', as: 'update_employee'
    post 'users/delete_user/:id', to: 'users/employees#delete_user', as: 'delete_employee'
  end
  
  devise_for :users,  :controllers => {:employees => "users/employees"}
  

  get 'home/index'
  
  root 'home#index'


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
