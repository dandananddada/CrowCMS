Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
  #article module
    resources :article_categories, path: 'article-category', except: :new
    #add a category under super category.
    get 'article-category/new/:parent_id', to: 'article_categories#new', as: :article_category_new, :constraints => { :parent_id => /\d/ }
   
    resources :articles, path: 'article'
    #reload article elements when categroy select changed.
    get 'article-concat', to: 'articles#article_concat'

    resources :article_pictures, path: 'article-picture', only: [:create, :destroy]
    #show pictures belongs specificy article.
    get 'article-picture/:article_id', to: 'article_pictures#index', as: :picture_by_article, :constraints => { :article_id => /\d/ }   

  #album module
    resources :album_tags, path: 'album-tags'
    resources :albums
    resources :photos, except: :new
    get 'photo/new/:album_id', to: 'photos#new', as: :photo_new, :constraints => { :parent_id => /\d/ }
  end

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
