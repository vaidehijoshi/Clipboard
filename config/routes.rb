Rails.application.routes.draw do
  


  get 'classes/:id/assignments/:id/remove_document', to: 'assignments#remove_document', as: 'remove_assignment_document'

  root :to => 'schools#index'

  resources :students do
    resources :guardians
  end

  resources :course_teacher_assignments

  resources :teachers do
    resources :course_sections, path: 'classes', as: 'classes' do
      resources :assignments
      resources :buddyships
      resources :enemyships
      resources :groups, only: [:index, :create, :show]
      get 'email', to: 'email#course_section'
      post 'email', to: 'email#course_section_send'
    end
  end

  resources :scores

  resources :student_course_sections, :only => [:create, :destroy, :show]

  resources :courses

  resources :schools

  
  resources :sessions, :only => [:create]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

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
