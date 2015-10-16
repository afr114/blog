Rails.application.routes.draw do
  root :to => 'users#index'
    resources :users, :only => [:index, :show]
      namespace :admin do
          get 'dashboard' => 'posts#index'
        resources :posts do
          resources :tags, :except => [:show, :index]
      end
    end
end
