Rails.application.routes.draw do

  resources :tags
  root to: 'events#index'

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
