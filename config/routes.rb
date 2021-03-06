Rails.application.routes.draw do

  post 'answers/create/:question_id' => 'answers#create', as:'answers_create'
  delete 'answers/destroy/:id' => 'answers#destroy', as:'answers_destroy'
  get 'questions/best_answer/:answer_id' => 'questions#best_answer',as:'best_answer'
  get 'questions/best_destroy/:answer_id' => 'questions#best_destroy',as:'best_destroy'
  
  resources :questions
  get 'users/show/:id'=> 'users#show',as:'usershow'

  get 'home/top'


  get 'notes/hello_index/:user_id'=>'notes#hello_index',as:'hello_index'
  

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout"},
    controllers: { omniauth_callbacks: "omniauth_callbacks" }

  get 'users/index/:note_id'=>'users#index',as:'user_index'

  get 'users/follow_index/:user_id'=>'users#follow_index',as:'user_follow_index'

  get 'users/follower_index/:user_id'=>'users#follower_index',as:'user_follower_index'
  
 root 'home#top'

 resources :notes 
  
  post 'comments/commentscreate/:note_id' => 'comments#commentscreate', as: 'comment'

  delete 'comments/commentsdestroy/:comment_id' => 'comments#commentsdestroy', as: 'commentsdes'

  get '/likes/create/:note_id' => 'likes#create', as: 'likescreate'

  delete '/likes/destroy/:note_id' => 'likes#destroy', as: 'likesdestroy'

  get 'users/relationsave/:user_id' => 'users#relationsave', as: 'relationsave'

  delete 'users/relationdestroy/:user_id' => 'users#relationdestroy', as: 'relationdestroy'

  
  resources :pets,only:[:create,:new,:show]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your rountes lay out with "rake routes".

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
