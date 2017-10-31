Rails.application.routes.draw do
  root to: "static_pages#root"

  resources :users
  resource :session
  resources :photos
  resources :upvotes
end
