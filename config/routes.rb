CloudfoundryUsergroups::Application.routes.draw do
 

  mount Ckeditor::Engine => '/ckeditor'

  get '/chapters/subregion_options' => 'chapters#subregion_options'

  get '/directory' => 'home#directory' , :as => "directory"
  get '/about' => 'home#about' , :as => "about"
  get '/wiki' => 'home#wiki' , :as => "wiki"
  
  resources :chapters do
     collection do
      post 'join_a_chapter'
      get  'chapter_admin_home_page'
     end
  end
  get 'messaging/messages' => 'messaging/messages#index' , :as => 'mymessages'
  get 'messaging/messages/new' => 'messaging/messages#new' , :as => 'compose'
  post 'messaging/messages/create' => 'messaging/messages#create' , :as => 'compose_create'
  get 'messaging/messages/:id' => 'messaging/messages#show' , :as => 'message_show'
  resources :messages , :as => "mail_messages" do
    collection do
      post 'reply'
    end
  end

  resources :posts do 
    collection do
      get 'chapterposts'
    end 
  end
  resources :comments
  resources :events do
    collection do 
      get 'oauth_reader'
      get 'userevents'
      get 'get_chapter_events'      
      get 'follow_an_event'
      get 'delete_an_event'
      get 'full_event_content'
      get 'title_list'
      post 'create_event_comment'
    end  
  end
resources :events, :has_many => :comments

#scope ':locale' do
  devise_for :users , :controllers => { :registrations => "registrations" } do
    get '/signin' => 'devise/sessions#new'   
    get '/users/confirm', :to => 'devise/confirmations#new'
    get '/users/reset_password', :to => 'devise/passwords#new'
    get '/users/change_password', :to => 'devise/passwords#edit'
  end
  get "admin/log_out" => "admin/sessions#destroy", :as => "log_out"
  get '/sign_up' , :to => 'users#edit'
  match '/verify_user' => 'federated#verify_user'
  match '/user_status' => 'federated#user_status' 
  match '/login' => 'federated#login', :as => :login
  match '/logout' => 'federated#logout'
  match '/profile' => 'users#profile' , :as => :profile
  
  match 'settings' => 'users#settings' , :as => :settings
  match 'settings_update/:id' => 'users#settings_update' , :as => :settings_update , :via => :put

   

#  match '/catchtoken' => 'home#catchtoken'
#  get '/event' , :to => 'home#event'
#  get '/mine' , :to => "home#mine"

  resources :users do
    collection do
      post 'uploader'
    end
  end

   namespace :admin do
    resources :sessions
    resources :announcements do
      collection do
        get 'announcement_history'
      end
    end
    resources :mails , :as => "mail_messages" do
      collection do
        post 'reply'
      end
    end
    resources :chapters do
      collection do
        get 'incubate'
        get 'active'
        get 'delist'
        get 'all'
      end
      member do
        get 'change_status'
        post 'chapter_reply'
      end
    end
   end
   
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
#  root :to => 'home#index'
#end
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
#  post '/local_selection/:local' , :to => "home#local_selection"
  root :to => 'home#index'

  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
