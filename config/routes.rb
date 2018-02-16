Rails.application.routes.draw do
  get 'active_incharge/home'
  get 'active_incharge/student_profile'
  get 'active_incharge/facultyProfile'
devise_for :users, controllers: { confirmations: 'confirmations' }
  root 'main#index'
  get 'main/aboutUs'
  get 'tasks/new'
  post 'tasks/create'
  get 'tasks/edit'
  patch 'tasks/update'
  put 'tasks/update'
  delete 'tasks/destroy'
  
  get 'selected_projects/complete'
  get 'selected_projects/create'
  post 'selected_projects/reject'
  
  get 'active_user/facultyShow'
  get 'active_user/facultyIndex'
  get 'active_user/home'
  get 'active_user/profile'
  get 'active_user/edit_profile'
  patch 'active_user/update_profile'

  get 'active_admin/home' 
  get 'active_admin/facultyProfile'
  get 'active_admin/student_profile'

  get 'main/index'
  
  devise_for :admins, path: 'admins'
  devise_for :users, path: 'users'
  devise_for :incharges, path: 'incharges'
    
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
