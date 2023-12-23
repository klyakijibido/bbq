Rails.application.routes.draw do
  resources :photos, only: [:create, :destroy]
  # devise_for :users
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'events#index'

  resources :users, only: %i[show edit update]

  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]

    post :show, on: :member
  end
end
