Rails.application.routes.draw do

  devise_for :users
  root "users#new"

  get "/login", to: "access#login"
  get "/logout", to: "access#logout"
  get "/signup", to: "users#new"
  get "/profile", to: "profile#index"
  get "/profile/personal", to: "profile#personal"

  post "/attempt_login", to: "access#attempt_login"

  resources :follows
  resources :users
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