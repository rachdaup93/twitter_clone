Rails.application.routes.draw do

  devise_for :users
  # , controllers: { sessions: 'users/sessions' }

  root "tweets#new"

  get "/profile", to: "profile#index"
  get "/profile/personal", to: "profile#personal"

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