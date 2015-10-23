Rails.application.routes.draw do
  devise_for :admins
  root :to => 'users#index'
    resources :users, :only => [:index, :show]
      namespace :admin do
          get 'dashboard' => 'posts#index'
        resources :posts do
          resources :tags 
      end
    end
end
