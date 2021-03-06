Rails.application.routes.draw do

  devise_for :users, :skip => [:registrations, :sessions]
  as :user do
    get 'signin' => 'devise/sessions#new', as: :new_user_session
    post 'signin' => 'devise/sessions#create', as: :user_session
    delete 'signout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  scope 'u', module: 'accounts' do
    get 'dashboard' => 'users#dashboard', as: 'user_root'
    # resources :users, only: []
    get 'profile/edit' => 'users#edit', as: :edit_user
    get 'profile' => 'users#show', as: :user
    patch 'profile' => 'users#update'
    put 'profile' => 'users#update'
  end

  devise_for :admins, :skip => [:registrations, :sessions]
  as :admin do
    get 'admins/signin' => 'devise/sessions#new', as: :new_admin_session
    post 'admins/signin' => 'devise/sessions#create', as: :admin_session
    delete 'admins/signout' => 'devise/sessions#destroy', as: :destroy_admin_session
  end

  scope 'a', module: 'admins', as: 'admin' do
    get 'dashboard' => 'users#dashboard', as: 'root'
    resources :subscription_plans
    resources :users
  end

  scope ':sub_domain', as: 'lodge' do
    resources :members, module: 'accounts'
  end

  get ':sub_domain/edit' => 'accounts/lodges#edit', as: :edit_lodge
  get ':sub_domain' => 'accounts/lodges#show', as: :lodge
  patch ':sub_domain' => 'accounts/lodges#update'
  put ':sub_domain' => 'accounts/lodges#update'

  match '(errors)/:status', to: 'errors#show',
    constraints: { status: /\d{3}/ },
    defaults: { status: '500' },
    via: :all

  root to: "content#index"
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
