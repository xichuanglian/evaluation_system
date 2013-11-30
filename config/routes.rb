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

  get   '/' => 'welcome#index', as: :root
  post  '/login' => 'welcome#login'
  get   '/new_login' => 'welcome#new_login'
  get   '/logout' => 'welcome#logout'

  get   '/students/:id/index' => 'students#index', as: :students_index
  get   '/students/:id/profile' => 'students#profile', as: :students_profile
  get   '/students/:id/forms' => 'students#forms', as: :students_forms

  get   '/admin/showall' => 'admin#showall', as: :admin_showall
  get   '/admin/new' => 'admin#new', as: :admin_addnew
  post  '/admin/create' => 'admin#create', as: :admin_create
  get   '/admin/detail/:id' => 'admin#detail', as: :admin_detail
  get   '/admin/edit/:id' => 'admin#edit', as: :admin_edit
  post  '/admin/update/:id' => 'admin#update', as: :admin_update

  get   '/teachers/:id/students_list' => 'teachers#students_list', as: :teachers_students_list
  get   '/teachers/:id/to_comment_list' => 'teachers#to_comment_list', as: :teachers_to_comment_list

  get   '/forms/:id' => 'evaluation_forms#show', as: :forms
  put   '/forms/:id' => 'evaluation_forms#update'
  get   '/forms/new' => 'evaluation_forms#new', as: :forms_new
  post  '/forms/new' => 'evaluation_forms#create'
  get   '/forms/:id/edit' => 'evaluation_forms#edit', as: :forms_edit
  get   '/forms/:id/pdf' => 'evaluation_forms#pdf', as: :forms_pdf
  get   '/forms/:id/comment/edit' => 'evaluation_forms#comment_edit', as: :forms_comment_edit
  put   '/forms/:id/comment' => 'evaluation_forms#comment_update', as: :forms_comment_update

end
