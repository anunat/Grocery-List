Rails.application.routes.draw do

  # Routes for the Friend resource:
  # CREATE
  get "/friends/new", :controller => "friends", :action => "new"
  post "/create_friend", :controller => "friends", :action => "create"

  # READ
  get "/friends", :controller => "friends", :action => "index"

  # DELETE
  get "/delete_friend/:id", :controller => "friends", :action => "destroy"
  #------------------------------

  root "users#editcurrentlist"
  #get('/', { :controller => 'users', :action => 'showcurrentlist' })

  # Routes for the Item resource:
  # CREATE
  get "/items/new", :controller => "items", :action => "new"
  post "/create_item", :controller => "items", :action => "create"

  get "/adddefaultitems", :controller => "items", :action => "adddefault"

  # READ
  get "/items", :controller => "items", :action => "index"

  # UPDATE
  get "/items/:id/edit", :controller => "items", :action => "edit"
  post "/update_item/:id", :controller => "items", :action => "update"

  post "/update_favitem/:id", :controller => "items", :action => "updatefav"


  # DELETE
  get "/delete_item/:id", :controller => "items", :action => "destroy"
  #------------------------------

  # Routes for the Listitem resource:
  # CREATE
  post "/create_listitem", :controller => "listitems", :action => "create"

   # UPDATE
   get "/listitems/:id/edit", :controller => "listitems", :action => "edit"
   post "/update_listitem/:id", :controller => "listitems", :action => "update"

  # DELETE
  get "/delete_listitem/:id", :controller => "listitems", :action => "destroy"
  #------------------------------

  # Routes for the Shoppinglist resource:
  # CREATE
  get "/create_freshlist", :controller => "shoppinglists", :action => "create"
  #get "/shoppinglists/newdefault", :controller => "shoppinglists", :action => "newdefault"
  get "/create_defaultlist", :controller => "shoppinglists", :action => "createdefault"

  # READ
  get "/shoppinglists", :controller => "shoppinglists", :action => "index"
  get "/shoppinglists/:id", :controller => "shoppinglists", :action => "show"

  # DELETE
  get "/delete_shoppinglist/:id", :controller => "shoppinglists", :action => "destroy"
  #------------------------------

  # Routes for the Unit resource:
  # CREATE
  get "/units/new", :controller => "units", :action => "new"
  post "/create_unit", :controller => "units", :action => "create"

  get "/units/inew", :controller => "units", :action => "newunit"
  post "/create_iunit", :controller => "units", :action => "createunit"

  get "/adddefaultunits", :controller => "units", :action => "adddefault"

  # READ
  get "/units", :controller => "units", :action => "index"

  # UPDATE
  get "/units/:id/edit", :controller => "units", :action => "edit"
  post "/update_unit/:id", :controller => "units", :action => "update"

  # DELETE
  get "/delete_unit/:id", :controller => "units", :action => "destroy"
  #------------------------------

  # Routes for the Department resource:
  # CREATE
  get "/departments/new", :controller => "departments", :action => "new"
  post "/create_department", :controller => "departments", :action => "create"

  get "/departments/inew", :controller => "departments", :action => "newdept"
  post "/create_idept", :controller => "departments", :action => "createdept"

  get "/adddefaultdept", :controller => "departments", :action => "adddefault"

  # READ
  get "/departments", :controller => "departments", :action => "index"

  # UPDATE
  get "/departments/:id/edit", :controller => "departments", :action => "edit"
  post "/update_department/:id", :controller => "departments", :action => "update"

  # DELETE
  get "/delete_department/:id", :controller => "departments", :action => "destroy"
  #------------------------------

  devise_for :users

  get "/users/showlist", :controller => "users", :action => "showcurrentlist"
  get "/friends/showlist/:id", :controller => "users", :action => "showfriendlist"

  get "/users/editlist", :controller => "users", :action => "editcurrentlist"

  get "/users/mydefaultlist", :controller => "users", :action => "showdefaultlist"
  get "/users/manage", :controller => "users", :action => "itemmanager"


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
