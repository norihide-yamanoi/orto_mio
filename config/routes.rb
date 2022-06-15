Rails.application.routes.draw do
  root to: 'events#index'
  resources :events do
    collection do
      post :confirm
    end
  end
end
