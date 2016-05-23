Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => 'registrations'
  }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # devise_scope :user do
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  # You can have the root of your site routed with "root"
    root 'welcome#index'
    get '/feed' => 'user_posts#feed'
    get '/profile' => 'users#show'
    get '/finish' => 'users#finish'
    get '/a' => 'welcome#a'
     get '/csrf' => 'welcome#csrf'

    resources :users do
      member do
        get :finish
      end
      member do
        get :following, :followers, :upvotes, :favorites
      end
      resources :taken_courses
      resources :current_courses
      resources :future_courses
      resources :educations
    end
    resources :groups do
      resources :group_members
      resources :group_posts do
        resources :group_post_votes, only: [:create, :destroy]
        resources :comments, shallow: true
      end
    end

    resources :follows, only: [:create, :destroy]

    resources :schools do
      resources :courses
    end

    # resources :groups do
    #   resources :group_members
    # end

    resources :user_posts do
      resources :post_comments
      resources :upvotes
      resources :favorites
    end

    resources :courses do
      resources :course_reviews
    end

    resources :course_posts do
      resources :course_comments
    end


  # Example of regular route:

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
