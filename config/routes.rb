Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get 'top/index'
  root to: 'top#index'

  get  'inquiry' => 'inquiry#index'
  post 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' => 'inquiry#thanks'

  resources :tags
  resources :favorites
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users

  get 'blogs/index_all'

  resources :events do
    collection do
      post :confirm
      get 'search'
    end
    resources :blogs do
      resources :comments, only: [:edit, :update, :create, :destroy]
      collection do
        post :confirm
        get 'search'
      end
    end
  end
end
