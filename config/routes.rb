ActionController::Routing::Routes.draw do |map|
  
  map.resources :plantillas, :has_many => :adjuntos
  
  map.resources :plantillas

  map.resources :listas, :member => { :delete_all => :delete }

  map.resources :users

  map.resources :tipo_vinculos

  map.resources :relacions

  map.resources :addresses

  map.resources :titulos
 
  map.resources :personas, :has_many => :comentarios
  map.resources :familias, :has_many => :comentarios
  map.resources :institucions, :has_many => :comentarios
  
  map.resources :personas, :has_many => :relacions
  map.resources :institucions, :has_many => :relacions

  map.resources :personas, :has_many => :listas
  map.resources :familias, :has_many => :listas
  map.resources :institucions, :has_many => :listas
 
  map.resources :empresas

  map.resources :personas
  
  map.resources :familias
  
  map.resource :session


  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "front"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
