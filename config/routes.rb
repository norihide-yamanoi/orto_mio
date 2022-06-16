Rails.application.routes.draw do

  root to: 'events#index'

  resources :tags

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
