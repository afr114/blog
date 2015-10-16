Rails.application.routes.draw do
      namespace :admin do
        resources :posts do
          resources :tags
    end  
  end
end
