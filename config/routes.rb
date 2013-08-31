Timeblocks::Application.routes.draw do
  resources :activities

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end