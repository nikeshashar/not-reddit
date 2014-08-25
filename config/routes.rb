Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resource :comments
    resource :votes

    collection do
      get 'newest'
      get 'top'
    end
  end

  resources :users do
    
  end

  root to: 'posts#index'
end
