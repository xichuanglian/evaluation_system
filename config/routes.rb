EvaluationSystem::Application.routes.draw do
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

  root  'welcome#index'
  post  '/login' => 'welcome#login'
  get   '/new_login' => 'welcome#new_login'
  get   '/logout' => 'welcome#logout'
  get   '/student/form' => 'student#form', as: :student_form
  post  '/student/save' => 'student#save', as: :student_save
  get   '/admin/showall' => 'admin#showall', as: :admin_showall
  get   '/admin/new' => 'admin#new', as: :admin_addnew
  post  '/admin/new' => 'admin#create'
  get   '/admin/edit/:id' => 'admin#edit', as: :admin_edit
  post  '/admin/edit/:id' => 'admin#update'
  get   '/form/:id' => 'evaluation_forms#show', as: :form
end
