Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :prototypes do
    resources :comments, only: :create
  end
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, only: :show
end
