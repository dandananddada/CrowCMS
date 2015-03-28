Rails.application.routes.draw do

  namespace :admin do
    resources :menus
  end

  root to: 'admin/home#index'

  devise_for :users, 
             controllers: { sessions: "users/sessions" }, 
             path: "", 
             path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }

  mount Ckeditor::Engine => '/ckeditor'
  
  namespace :admin do

  #friend links
    resources :friend_links, path: 'friend-link'


  #article module
    resources :categories, path: 'category', except: :new do
        #add a category under super category.
        get 'new', to: 'categories#new', 
                   on: :member, 
                   as: :new, 
                   :constraints => { :parent_id => /\d/ }
    end

    resources :articles, path: 'article' do
        #reload article elements when categroy select changed.
        get 'concat', to: 'articles#article_concat', on: :collection
        delete 'multi-destroy', to: 'articles#multi_destroy', on: :collection
    end
    resources :article_options, path: 'article-option'
    resources :article_pictures, path: 'article-picture', only: [:create, :destroy] do
      #show pictures belongs specificy article.
      get '',  to: 'article_pictures#index', 
               as: :picture_by, 
               :constraints => { :article_id => /\d/ },
               on: :member  
    end
  #album module
    resources :album_tags, path: 'album-tags'
    resources :albums
    resources :photos, except: :new do
      get 'new', to: 'photos#new', 
                 as: :photo_new, 
                 :constraints => { :parent_id => /\d|nil/ },
                 on: :member
    end

  #page module
    resources :pages, path: 'page'
    
  #trash module
    namespace :trash do
      #for article
      resources :articles, path: 'article', only: [:index, :destroy] do
        put 'restore', to: 'articles#restore', on: :member
        delete 'multi-destroy', to: 'articles#multi_destroy', on: :collection
      end
      #for pages
      resources :pages, path: 'page', only: [:index, :destroy] do
        put 'restore', to: 'pages#restore', on: :member
      end
    end
    #end trash namespae
    
    #message module
    resources :messages, path: 'message' do
      put 'review', to: 'messages#review', on: :member
    end

  end 
  #end admin namespace

   namespace :api do
      get 'categories', to: 'categories#index'
      get 'category/:id', to: 'categories#show'
      get 'articles', to: 'articles#index'
      get 'article/:id', to: 'articles#show'
      get 'articles/title/:title', to: 'articles#search_by_title'
   end

   get 'test', to: 'home/index#index'
   get 'article/:id', to: 'home/article#show'
   get 'about-us', to: 'home/page#about_us'
   get 'contract-us', to: 'home/page#contract_us'

end
