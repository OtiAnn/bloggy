Rails.application.routes.draw do
  resources :comments

  devise_for :users
  get 'pages/about'
  get 'pages/admin'
  get 'pages/contact'

  resources :categories

<<<<<<< HEAD
  namespace :admin do
    resources :posts
  end
  
  root 'home#index'
  
=======
  resources :posts

>>>>>>> admin
  # get "posts", :to => "admin/posts#index"
  # get "posts/new", :to => "admin/posts#new"
  # get 'posts/:id/edit', :to => 'admin/posts#edit', as: :edit_post
  # get 'posts/:id/show', :to => 'admin/posts#show', as: :post
  # get 'posts/:id/destroy', :to => 'admin/posts#destroy'
  # get "post", :to => "admin/post"
  # 上面是曾經想偷懶不改所有erb路徑時做的轉換

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
