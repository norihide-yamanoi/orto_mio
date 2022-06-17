Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root to: 'events#index'

  resources :tags
  resources :favorites

  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"

  resources :events do
    collection do
      post :confirm
    end
  end

  resources :blogs do
    collection do
      post :confirm
    end
  end
end
