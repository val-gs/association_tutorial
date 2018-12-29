Rails.application.routes.draw do
  root 'tweets#index'
  devise_for :users

  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:new, :create, :destroy]
  end


  resources :users

end
