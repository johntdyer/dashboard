Dashboard::Application.routes.draw do

      devise_for :users

     resources :browsers
     resources :partition_platforms

     match 'ppid/:id' => 'partition_platforms#show', :as => :partition_platforms
     match 'ppids' => 'partition_platforms#index', :as => :partition_platforms

   root :to => "home#index"
end
