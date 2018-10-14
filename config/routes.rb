Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :api, defaults: { format: :json } do
    resources :topics do
      resources :replies, except: [:show, :destroy]
    end
    resources :replies, only: [:show, :destroy]
    devise_for :users, controllers: { sessions: 'sessions' }, :skip => :passwords
    devise_scope :user do
      get 'users/current', to: 'sessions#show'
    end
  end
  
  # root to: "topics#index"
end
