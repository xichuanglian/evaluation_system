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

  put   '/student_profiles/:id/preliminary_exam' => 'student_profiles#preliminary_exam_update', as: :student_profiles_preliminary_exam
  put   '/student_profiles/:id/oral_exam' => 'student_profiles#oral_exam_update',as: :student_profiles_oral_exam
  put   '/student_profiles/:id/thesis_proposal' => 'student_profiles#thesis_proposal_update', as: :student_profiles_thesis_proposal

  post  '/student_profiles/:id/education_infos/new' => 'education_infos#new', as: :student_profiles_education_infos_new
  delete '/education_infos/:id/delete' => 'education_infos#delete', as: :education_infos_delete

  get   '/admin/show_students' => 'admin#show_students', as: :admin_show_students
  get   '/admin/show_teachers' => 'admin#show_teachers', as: :admin_show_teachers
  get   '/admin/new_student' => 'admin#new_student', as: :admin_new_student
  get   '/admin/new_teacher' => 'admin#new_teacher', as: :admin_new_teacher
  post  '/admin/create_student' => 'admin#create_student', as: :admin_create_student
  post  '/admin/create_teacher' => 'admin#create_teacher', as: :admin_create_teacher
  get   '/admin/detail_student/:id' => 'admin#detail_student', as: :admin_detail_student
  get   '/admin/edit_student/:id' => 'admin#edit_student', as: :admin_edit_student
  get   '/admin/edit_teacher/:id' => 'admin#edit_teacher', as: :admin_edit_teacher
  post  '/admin/update_student/:id' => 'admin#update_student', as: :admin_update_student
  post  '/admin/update_teacher/:id' => 'admin#update_teacher', as: :admin_update_teacher

  get   '/teachers/:id/index' => 'teachers#index', as: :teachers_index
  get   '/teachers/:id/students_list' => 'teachers#students_list', as: :teachers_students_list
  get   '/teachers/:id/to_comment_list' => 'teachers#to_comment_list', as: :teachers_to_comment_list
  get   '/teachers/:id/commented_list' => 'teachers#commented_list', as: :teachers_commented_list
  get   '/teachers/:id/students_form_list' => 'teachers#students_form_list', as: :teachers_students_form_list

  get   '/forms/:id' => 'evaluation_forms#show', as: :forms
  put   '/forms/:id' => 'evaluation_forms#update'
  get   '/forms/new' => 'evaluation_forms#new', as: :forms_new
  post  '/forms/new' => 'evaluation_forms#create'
  get   '/forms/:id/edit' => 'evaluation_forms#edit', as: :forms_edit
  get   '/forms/:id/pdf' => 'evaluation_forms#pdf', as: :forms_pdf
  get   '/forms/:id/comment/edit' => 'evaluation_forms#comment_edit', as: :forms_comment_edit
  put   '/forms/:id/comment' => 'evaluation_forms#comment_update', as: :forms_comment_update

end
