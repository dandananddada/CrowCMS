Rails.application.routes.draw do


  apipie
  root to: 'admin/home#index'

  devise_for :users, 
             controllers: { sessions: "users/sessions" }, 
             path: "", 
             path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }

  mount Ckeditor::Engine => '/ckeditor'
  
  namespace :admin do

  #menu 
    resources :menus, path: 'menu', except: :new do
        #add a category under super category.
        get 'new', to: 'menus#new', 
                   on: :member, 
                   as: :new, 
                   :constraints => { :parent_id => /\d/ }
    end

  #banner
    resources :banners, path: 'banner'
  #links
    resources :links, path: 'link'


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
               constraints: { article_id: /\d/ },
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

    get 'visit', to: 'statistics#index', as: 'visit'

  end 
  #end admin namespace

   namespace :api do
      # api for layouts
      get 'menus',                 to: 'layouts#menus'
      get 'link',                  to: 'layouts#friend_links'
      get 'categories',            to: 'categories#index'
      get 'category/:id',          to: 'categories#show'
      get 'articles',              to: 'articles#index'
      get 'article/:id',           to: 'articles#show'
      get 'articles/title/:title', to: 'articles#search_by_title'
   end

   get 'home',        to: 'home/index#index'
   get 'news',        to: 'home/article#news'
   get 'notices',     to: 'home/article#notices'
   get 'products',    to: 'home/article#products'
   get 'article/:id', to: 'home/article#show',    as: 'article'
   get 'product/:id', to: 'home/article#product', as: 'product'
   get 'albums',      to: 'home/album#list',      as: 'albums'
   get 'album/:id',   to: 'home/album#show',      as: 'album'
   get 'about-us',    to: 'home/page#about_us'
   get 'contract-us', to: 'home/page#contract_us'

end
