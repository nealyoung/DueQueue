WebJam::Application.routes.draw do
  root :to => 'home#index'
  
  # Courses
  post 'create_course' => 'courses#create', :as => 'create_course'
  delete 'courses/:id' => 'courses#destroy', :as => 'delete_course'
  
  # Users
  get 'sign_up' => 'users#new', :as => 'sign_up'
  post 'create_user' => 'users#create', :as => 'create_user'
  delete 'users/:id' => 'users#destroy', :as => 'delete_user'
  
  put 'users/:id' => 'users#update', :as => 'user'
  
  get 'settings' => 'users#settings', :as => 'settings'
  get 'join_course' => 'users#join_course', :as => 'join_course'
  get 'leave_course' => 'users#leave_course', :as => 'leave_course'
  post 'complete_assignment' => 'users#complete_assignment', :as => 'complete_assignment'

  # Assignments
  post 'create_assignment' => 'assignments#create', :as => 'create_assignment'
  delete 'assignments/:id' => 'assignments#destroy', :as => 'delete_assignment'
  get 'report_assignment/:id' => 'assignments#report', :as => 'report_assignment'
  
  # Sessions
  get 'log_in' => 'sessions#new', :as => 'log_in'
  post 'validate_user' => 'sessions#create', :as => 'validate_user'
  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  
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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
