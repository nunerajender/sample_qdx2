Rails.application.routes.draw do
  resources :pics
  resources :countries
  resources :people
  resources :states
  mount Ckeditor::Engine => '/ckeditor'
  get 'rooms/index'

  get 'rooms/create'

  get 'rooms/party'

  get 'rooms/config_opentok'

  get 'home/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :profiles
  resources :profiles
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
controllers: {omniauth_callbacks: "omniauth_callbacks"}





  get 'welcome/index'
   resources :welcome do
 member do
      get :following, :followers
    end
collection do
get 'user_list'
end
end
   resources :contacts, only: [:new, :create]

 #resources :conversations do
#resources :messages
#end
  resources :posts do
   collection { post :import }
    resources :comments
  end
 # conversations
resources :conversations do
member do
post :reply
post :trash
post :untrash
end
end
  #root :to => 'rooms#index'
    resources :rooms
   match '/party/:id' , :to => 'rooms#party', :as => :party, :via => :get
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'
  # root 'home#index'
    # mailbox folder routes
get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
  #___________________________________________________________________
   #namespace :admin do
  #get 'users/index'
  #end

  #namespace :admin do
    #resources :users
  #get 'users/edit'
  #end

  #namespace :admin do
 # get 'users/update_status' => 'users#update_status'
  #end

  #namespace :admin do
   #patch 'users/update_user'
  #end

 # namespace :admin do
  #  get 'users/show_order' => 'users#show_order'
 # end

  #namespace :admin do
  #get 'users/delete'
 # end
  #______________________________________
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
