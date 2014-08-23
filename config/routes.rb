Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resource :comments
  end

  root to: 'posts#index'
end
