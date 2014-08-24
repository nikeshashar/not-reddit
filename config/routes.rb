Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resource :comments
    resource :votes
  end

  root to: 'posts#index'
end
