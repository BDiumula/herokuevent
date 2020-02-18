Rails.application.routes.draw do
  devise_for :users
root to: 'event#index'
resources :event
resources :users
end
