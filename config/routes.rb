Rails.application.routes.draw do
      namespace :admin do
          get 'dashboard' => 'posts#index'
        resources :posts do
          resources :tags, :except => [:show, :index]
      end
  end
end
