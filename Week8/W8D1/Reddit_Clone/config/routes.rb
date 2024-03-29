Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resource :session
  resources :subs, except: [:destroy] do
    resources :posts, only: [:index, :create]
  end
  resources :posts
end
