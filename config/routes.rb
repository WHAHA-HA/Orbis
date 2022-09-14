Rails.application.routes.draw do
  devise_for :users, path: '/', path_names: { sign_in:      'login',
                                              sign_out:     'logout',
                                              sign_up: 'register' },
             controllers:        { registrations: 'registrations',
                                   :omniauth_callbacks => "omniauth_callbacks"
                                  }

  devise_for :admins, path: '/admin', path_names: { sign_in: 'login', sign_out: 'logout'},
             controllers: { sessions: 'admin/sessions'},
             :skip => [:registrations]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  authenticated :user do
    root 'users#edit_category', as: :user_root
  end

  authenticated :admin do
    root :path => 'admin', to: 'admin/accounts#index', as: :admin_root
  end

  namespace :admin do
    get '/', :to => 'accounts#index'
    resources :accounts
    resources :posts
    resources :categories
    get :new_schedule, to: 'posts#new_schedule'
    post :create_schedule, to: 'posts#create_schedule'
  end
  # get :edit_category, to: 'users#edit_category'
  resource :users do
    member do
      get :edit_category
      patch :update_category
      get :edit_account
      patch :update_account
      post :set_user_category
      post :store_other_category
    end
  end

  resources :posts, only:[:index]
  resources :accounts, path: 'account', only:[:index] do
  end
  put :update_setting, to: 'accounts#update_setting', as: :update_setting
  post :set_default_profile, to: 'accounts#set_default_profile', as: :set_default_profile

  root 'home#index'

  get 'users/terms-and-conditions' => 'users#terms_and_conditions'
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
