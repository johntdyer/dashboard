Dashboard::Application.routes.draw do

  resources :nodes

  resources :phonos

  resources :browsers
  resources :partition_platforms

  match "/browsers/:browser", :constraints => {:browser => /[^\/]+/}, :to => "browsers#show"

  #match 'routing/:zone/:id', :constraints => {:id => /[^\/]+/}, :to => "route#update",  :via => [:put]
  #match 'routing/:zone/:id', :constraints => {:id => /[^\/]+/}, :to => "route#destroy",  :via => [:delete]
  #match 'routing/:zone/:id', :constraints => {:id => /[^\/]+/}, :to => "route#show",  :via => [:get]


  match 'routing/:zone/', :to => "route#destroy",  :via => [:delete]
  match 'routing/:zone/', :to => "route#update",  :via => [:put]
  match 'routing/:id', :constraints => {:id => /[^\/]+/}, :to => "route#show",  :via => [:get]

  match 'ppid/:id' => 'partition_platforms#show', :as => :partition_platforms

  match 'ppids' => 'partition_platforms#index', :as => :partition_platforms

  match 'phono' => 'phonos#index', :as => :phonos

  root :to => "home#index"

  match "/status/:browser", :constraints => {:browser => /[^\/]+/}, :to => "browsers#show"

end
