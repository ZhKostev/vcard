Vcard::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  scope :module => "admin" do
    match '/my_site' => 'admin_main#main'
    resources :rubrics
    resources :articles
    resources :subscribes
  end

  devise_for :users

  get "support/change_language"

  root :to => 'home#index'

  scope "(:locale)", :locale => /en|ru/ do
    match '/' => 'home#index'
    match '/about' => 'home#about'
    match '/resume' => 'home#resume'
    match '/contact' => 'home#contact'
    match '/blog' => 'home#blog'
    match '/blog/subscribe' => 'blog#subscribe', :as => :subscribe_to_blog
    match '/blog/unsubscribe/:id' => 'blog#unsubscribe', :as => :unsubscribe_from_blog
    match '/blog/:id' => 'blog#show_rubric', :as => :show_rubric
    match '/blog/article/:id' => 'blog#show_article', :as => :show_article
    match '/change_language' => 'home#change_language'
    match '/contact/send_email' => 'contact#send_email'
  end

  # Any routes that aren't defined above here go to the 404
  match "*a", :to => "blog#routing_error"



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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
