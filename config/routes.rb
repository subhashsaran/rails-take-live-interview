Onecheck::Application.routes.draw do
#devise_for :users
  devise_for :users, :controllers => {
                      :registrations => "users/registrations",
                      :omniauth_callbacks => "users/omniauth_callbacks"}
  devise_scope :user do
  #get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
  #get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  match "/login" => "devise/sessions#new" # Add a custom sign in route for user sign in
  match "/logout" => "devise/sessions#destroy" # Add a custom sing out route for user sign out
  match "/login/forgot-password" => "devise/passwords#new" # Add a Custom Route for Forgot password
  match "/login/restore-password" => "devise/passwords#create" # Add a Custom Route for Forgot password

  end
  match "/interview/new" => "interview#new"
  match "/interview/show" => "interview#show"
  match "/interview/delete" => "interview#delete"
  match "/interview/edit" => "interview#edit"
  match "/interview/my_interviews" => "interview#my_interviews"
  match "/interview/close" => "interview#close"
  post "/interview/create" => "interview#create"
  post "/interview/update" => "interview#update"
  match "/apply/apply_interview" => "apply#apply_interview"
  match "/question/delete" => "question#delete"
  match "/answer/delete" => "answer#delete"
  #match "/interview/remove_question" => "interview#remove_question"
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

root :to => 'home#index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id))(.:format)'
end
