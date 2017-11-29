Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  devise_scope :user do
    authenticated :user do
      root to: "profile#index"
      get "/profile/personal", to: "profile#personal"
    end
    unauthenticated :user do
      get "/signup", to: "devise/registrations#new"
      root to: "devise/registrations#new", as: :unauthenticated_root
      get "/login", to: "devise/sessions#new"
    end
  end

  resources :follows
  resources :tweets do
    member do
      post "likes"
    end
    member do
      post "dislikes"
    end
    member do
      get "delete"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end