Rails.application.routes.draw do
  
  root to: 'admin/home#index'

  devise_for :users, 
             controllers: { sessions: "users/sessions" }, 
             path: "", 
             path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }

  mount Ckeditor::Engine => '/ckeditor'
  
  namespace :admin do
  #article module
    resources :article_categories, path: 'article-category', except: :new do
        #add a category under super category.
        get 'new', to: 'article_categories#new', 
                   on: :member, 
                   as: :article_category_new, 
                   :constraints => { :parent_id => /\d/ }
    end

    resources :articles, path: 'article' do
        #reload article elements when categroy select changed.
        get 'concat', to: 'articles#article_concat', on: :collection
    end

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
  end

end
