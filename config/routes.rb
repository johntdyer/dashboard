Dashboard::Application.routes.draw do

  resources :phonos

     devise_for :users

     resources :browsers
     resources :partition_platforms

     match "/browsers/:browser", :constraints => {:browser => /[^\/]+/}, :to => "browsers#show"

     match 'routing/:zone/:id', :constraints => {:id => /[^\/]+/}, :to => "route#update",  :via => [:put]
     match 'routing/:zone/:id', :constraints => {:id => /[^\/]+/}, :to => "route#destroy",  :via => [:delete]
     match 'routing/:zone/:id', :constraints => {:id => /[^\/]+/}, :to => "route#index",  :via => [:get]
#     match 'routing', :to => "route#update",  :via => [:put, :delete, :get]
     match 'ppid/:id' => 'partition_platforms#show', :as => :partition_platforms
     match 'ppids' => 'partition_platforms#index', :as => :partition_platforms

     root :to => "home#index"

     match "/status/:browser", :constraints => {:browser => /[^\/]+/}, :to => "browsers#show"

end
