Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resource :comments
    resource :votes

    collection do
      get 'newest'
      get 'top'
      get 'controversial'
    end
  end

  resources :users
  resources :comments
  root to: 'posts#index'
end
